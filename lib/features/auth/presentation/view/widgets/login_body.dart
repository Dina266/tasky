import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tasky/core/helpers/extensions.dart';
import 'package:tasky/core/routers/routing.dart';
import 'package:tasky/core/widgets/custom_button.dart';
import 'package:tasky/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  bool obscureText = true;
  String? finalPhoneNumber;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Form(
        key: context.read<AuthCubit>().signInFormKey,
        child: Column(
          children: [
            IntlPhoneField(
              controller: context.read<AuthCubit>().signInPhoneNumber,
              decoration: InputDecoration(
                hintText: '123 456-7890',
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffBABABA),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              initialCountryCode: 'EG',
              dropdownIconPosition: IconPosition.trailing,
              flagsButtonPadding: EdgeInsets.symmetric(horizontal: 8),
              onChanged: (phone) {
                finalPhoneNumber = phone.completeNumber;
                setState(() {});
              },
            ),
            TextFormField(
              controller: context.read<AuthCubit>().signInPassword,
              obscureText: obscureText,
              validator: (value) {
                if (!value!.isValidPassword) {
                  return 'password not valid';
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                hintText: 'Password...',
                hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff7F7F7F)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(),
                    borderRadius: BorderRadius.circular(10)),
                suffixIcon: IconButton(
                  icon: Icon(
                    obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                ),
              ),
            ),
            Gap(24.h),
            CustomButton(
                txt: Text(
                  'Sign In',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700),
                ),
                onPressed: () {
                  // log(finalPhoneNumber!);
                  // context.read<AuthCubit>().signInPhoneNumber.text =
                  //     finalPhoneNumber!;
                      // log(context.read<AuthCubit>().signInPhoneNumber.text);
                  context.read<AuthCubit>().signIn(finalPhoneNumber!);
                  // context.pushReplacementNamed(Routing.)
                }),
          ],
        ),
      ),
    );
  }
}
