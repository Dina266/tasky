
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tasky/core/helpers/extensions.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../view_model/auth_cubit/auth_cubit.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({super.key});

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  String? selectedExperienceLevel;
  bool obscureText = true;
  String? finalPhoneNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Form(
        key: context.read<AuthCubit>().signUpFormKey,
          child: Column(
        children: [
          TextFormField(
            controller: context.read<AuthCubit>().signUpName,
            validator: (value) {
              if (!value!.isValidName) {
                return 'Name not valid';
              } else {
                return null;
              }
            },
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              hintText: 'Name...',
              hintStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff7F7F7F)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(),
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
          Gap(15.h),
          IntlPhoneField(
            controller: context.read<AuthCubit>().signUpPhoneNumber,
            decoration: InputDecoration(
              hintText: '123 456-7890',
              hintStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffBABABA)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(),
                  borderRadius: BorderRadius.circular(10)),
            ),
            onChanged: (phone) {
              setState(() {
                finalPhoneNumber = phone.completeNumber;
              });
            },
            initialCountryCode: 'EG',
            dropdownIconPosition: IconPosition.trailing,
            flagsButtonPadding: EdgeInsets.symmetric(horizontal: 8),
          ),
          TextFormField(
            controller: context.read<AuthCubit>().experienceYears,
            validator: (value) {
              if (value == null) {
                return 'is Required';
              } else {
                return null;
              }
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Years of experience...',
              hintStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff7F7F7F)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(),
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
          Gap(15.h),
          DropdownButtonFormField<String>(
            value: selectedExperienceLevel,
            hint: Text('Choose experience Level'),
            onChanged: (String? newValue) {
              setState(() {
                selectedExperienceLevel = newValue;
                context.read<AuthCubit>().experienceLevel.text= selectedExperienceLevel!;
              });
            },
            items: <String>['fresh' , 'junior' , 'midLevel' , 'senior']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(),
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
          Gap(15.h),
          TextFormField(
            controller: context.read<AuthCubit>().address,
            validator: (value) {
              if (value == null) {
                return 'address not valid';
              } else {
                return null;
              }
            },
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: 'Address...',
              hintStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff7F7F7F)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(),
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
          Gap(15.h),
          TextFormField(
            controller: context.read<AuthCubit>().signUpPassword,
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
                  obscureText ? Icons.visibility : Icons.visibility_off,
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
          Gap(15.h),
          CustomButton(
              txt: Text(
                'Sign Up',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700),
              ),
              onPressed: () {
                // log(finalPhoneNumber!);
                context.read<AuthCubit>().signUp(finalPhoneNumber!);
              }),
        ],
      )),
    );
  }
}
