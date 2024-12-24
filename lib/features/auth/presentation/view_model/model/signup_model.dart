
import '../../../../../core/api/end_points.dart';

class SignUpModel {
  final String id;
  final String displayName;
  final String access_token;
  final String refresh_token;

  factory SignUpModel.fromJson(Map<String, dynamic> jsonData) {
    return SignUpModel(
      id: jsonData[ApiKey.id],
      displayName: jsonData[ApiKey.name],
      access_token: jsonData[ApiKey.accessToken],
      refresh_token: jsonData[ApiKey.refreshToken],
      );
  }

  SignUpModel({required this.id, required this.displayName, required this.access_token, required this.refresh_token});
}