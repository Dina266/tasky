
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:tasky/core/errors/exceptions.dart';
import '../../../../../core/api/api_consumer.dart';
import '../../../../../core/api/end_points.dart';
import '../../../../../core/database/cache/cache_helper.dart';
import '../model/signin_model.dart';
import '../model/signup_model.dart';
import '../model/user_model.dart';

class UserRepository {
  final ApiConsumer api;

  UserRepository({required this.api});
  Future<Either<String, SignInModel>> signIn({
    required String phone,
    required String password,
  }) async {
    try {
      final response = await api.post(
        EndPoint.signIn,
        data: {
          ApiKey.phone: phone,
          ApiKey.password: password,
        },
      );
      final user = SignInModel.fromJson(response);
      final decodedAccessToken = JwtDecoder.decode(user.accessToken);
      final decodedRefreshToken = JwtDecoder.decode(user.refreshToken);
      CacheHelper().saveData(key: ApiKey.token, value: user.id);
      CacheHelper().saveData(key: ApiKey.id, value: decodedAccessToken[ApiKey.id]);
      CacheHelper().saveData(key: ApiKey.id, value: decodedRefreshToken[ApiKey.id]);
      log(response);
      log(user.toString());
      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  Future<Either<String, SignUpModel>> signUp({
    required String displayName,
    required String phone,
    required String experienceLevel,
    required String experienceYears,
    required String address,
    required String password,
    // required XFile profilePic,
  }) async {
    try {
      final response = await api.post(
        EndPoint.signUp,
        isFromData: true,
        data: {
          ApiKey.name: displayName,
          ApiKey.phone: phone,
          ApiKey.experienceYears: experienceYears,
          ApiKey.experienceLevel: experienceLevel,
          ApiKey.password: password,
          ApiKey.address: address,
          // ApiKey.profilePic: await uploadImageToAPI(profilePic)
        },
      );
      log(response.toString());
      final signUPModel = SignUpModel.fromJson(response);
      return Right(signUPModel);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  Future<Either<String, UserModel>> getUserProfile() async {
    try {
      final response = await api.get(
        EndPoint.getUserDataEndPoint(
          CacheHelper().getData(key: ApiKey.id),
        ),
      );
      
      return Right(UserModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }
}