
import '../../../../../core/api/end_points.dart';

class SignUpModel {
  final String message;
  final String error;
  final String statusCode;

  SignUpModel({required this.error,required this.statusCode, required this.message});
  factory SignUpModel.fromJson(Map<String, dynamic> jsonData) {
    return SignUpModel(
      message: jsonData[ApiKey.message],
      error: jsonData[ApiKey.errorMessage],
      statusCode: jsonData[ApiKey.status],
      );
  }
}