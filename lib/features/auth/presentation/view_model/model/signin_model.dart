
import '../../../../../core/api/end_points.dart';

class SignInModel {
  final String id;
  final String accessToken;
  final String refreshToken;

  SignInModel({required this.id, required this.accessToken , required this.refreshToken});

  factory SignInModel.fromJson(Map<String, dynamic> jsonData) {
    return SignInModel(
      id: jsonData[ApiKey.id],
      accessToken: jsonData[ApiKey.accessToken],
      refreshToken: jsonData[ApiKey.refreshToken],
    );
  }
}