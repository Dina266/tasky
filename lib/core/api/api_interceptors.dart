import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tasky/core/database/cache/cache_helper.dart';
import 'api_consumer.dart';
import 'end_points.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiKey.token] =
        CacheHelper().getData(key: ApiKey.token) != null
            ? '${CacheHelper().getData(key: ApiKey.id)}'
            : null;
    super.onRequest(options, handler);
  }

  final ApiConsumer api;
  String? accessToken;
  FlutterSecureStorage storage = FlutterSecureStorage();

  ApiInterceptor({required this.api});
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    super.onError(err, handler);

    // If the error is due to JWT expiration, refresh the token
    if (err.response?.statusCode == 401 &&
        err.response?.data['message'] == 'Invalid JWT') {
      if (await storage.containsKey(key: 'refreshToken')) {
        await refreshToken();
        return handler.resolve(await retry(err.requestOptions));
      }
    }
    return handler.next(err);
  }

  // Retry the failed request after refreshing the token
  Future<Response<dynamic>> retry(RequestOptions requestOptions) async {
  final options = Options(
    method: requestOptions.method,
    headers: requestOptions.headers,
  );

  try {
    // Call the API request
    final result = await api.request(
      requestOptions.path,
      method: requestOptions.method,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );

    // Return the response as a Response object
    return Response<dynamic>(
      requestOptions: requestOptions,
      data: result,
      statusCode: 200, // or any other appropriate status code
    );
  } catch (e) {
    // If there's an error, you can throw an exception or handle it as needed
    throw Exception("Failed to retry the request: $e");
  }
}
  // Refresh the token and update the accessToken
  Future<void> refreshToken() async {
    final refreshToken = await storage.read(key: 'refreshToken');
    final response = await api.post(
      'https://todo.iraqsapp.com/auth/refresh-token',
      data: {'token': refreshToken},
    );

    if (response['statusCode'] == 201) {
      accessToken = response['data'];
      // Store the new access token
      await storage.write(key: 'accessToken', value: accessToken);
    } else {
      accessToken = null;
      await storage.deleteAll(); // Clear all storage
    }
  }

}
