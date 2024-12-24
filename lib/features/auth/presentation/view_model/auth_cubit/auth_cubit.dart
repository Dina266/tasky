import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../model/signin_model.dart';
import '../model/user_model.dart';
import '../repo/user_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.userRepository) : super(AuthInitial());

  final UserRepository userRepository;
  //Sign in Form key
  // GlobalKey<FormState> signInFormKey = GlobalKey();
  //Sign in email
  TextEditingController signInEmail = TextEditingController();
  //Sign in password
  TextEditingController signInPassword = TextEditingController();
  //Sign Up Form key
  // GlobalKey<FormState> signUpFormKey = GlobalKey();
  //Profile Pic
  XFile? profilePic;
  //Sign up name
  TextEditingController signUpName = TextEditingController();
  //Sign up phone number
  TextEditingController signUpPhoneNumber = TextEditingController();
  TextEditingController signInPhoneNumber = TextEditingController();
  //Sign up email
  TextEditingController signUpEmail = TextEditingController();
  //Sign up password
  TextEditingController signUpPassword = TextEditingController();
  //Sign up confirm password
  TextEditingController confirmPassword = TextEditingController();

  TextEditingController experienceYears = TextEditingController();
  TextEditingController experienceLevel = TextEditingController();
  TextEditingController address = TextEditingController();
  SignInModel? user;

  uploadProfilePic(XFile image) {
    profilePic = image;
    emit(UploadProfilePic());
  }

  signUp(String phone) async {
    emit(SignUpLoading());
    final response = await userRepository.signUp(
      displayName: signUpName.text,
      phone: phone,
      experienceYears: experienceYears.text,
      experienceLevel: experienceLevel.text,
      password: signUpPassword.text,
      address: address.text,
      // profilePic: profilePic!,
    );
    response.fold(
      (errMessage) => emit(SignUpFailure(errMessage: errMessage)),
      (signUpModel) => emit(SignUpSuccess(token: signUpModel.access_token)),
    );
  }

  signIn(String phone) async {
    emit(SignInLoading());
    final response = await userRepository.signIn(
      password: signInPassword.text,
      phone: phone,
    );
    response.fold(
      (errMessage) => emit(SignInFailure(errMessage: errMessage)),
      (signInModel) => emit(SignInSuccess()),
    );
  }

  void getUserProfile() async {
  emit(GetUserLoading());
  final response = await userRepository.getUserProfile();
  response.fold(
    (errMessage) => emit(GetUserFailure(errMessage: errMessage)),
    (user) => emit(GetUserSuccess(user: user)),
  );
}

}