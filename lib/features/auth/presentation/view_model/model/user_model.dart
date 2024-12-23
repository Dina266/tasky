
import '../../../../../core/api/end_points.dart';

class UserModel {
  final String phone;
  final String password;
  final String displayName;
  final String experienceYears;
  final String address;
  final String level;

  UserModel({
    required this.password,
    required this.phone,
    required this.displayName,
    required this.experienceYears,
    required this.address,
    required this.level,
  });

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
      phone: jsonData[ApiKey.phone],
      password: jsonData[ApiKey.password],
      displayName: jsonData[ApiKey.name],
      experienceYears: jsonData[ApiKey.experienceYears],
      address: jsonData['address'],
      level: jsonData['level'],
    );
  }
}