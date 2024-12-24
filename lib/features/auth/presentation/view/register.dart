import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:tasky/core/helpers/extensions.dart';
import 'package:tasky/features/auth/presentation/view/widgets/register_body.dart';

import '../../../../core/routers/routing.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/art.png',
              height: 430.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.5.w),
              child: Text(
                'Login',
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700),
              ),
            ),
            RegisterBody(),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Didn\'t have any account?',style:  TextStyle(color: Color(0xff7F7F7F), fontSize: 14.sp, fontWeight: FontWeight.w700),),
                TextButton(
                  onPressed: (){
                    context.pushNamed(Routing.login);
                  },
                  child: Text('Sign In here',style:  TextStyle(color: Color(0xff5F33E1), fontSize: 14.sp, fontWeight: FontWeight.w700),),
                ),
              ],
            ),
            Gap(24.h),
          ],
        )),
    );
  }
}