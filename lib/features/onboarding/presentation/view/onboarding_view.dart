import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
                children: [
          Image.asset(
            'assets/images/art.png',
          ),
          SizedBox(
              width: 235.w,
              height: 62.h,
              child: Text(
                'Task Management &To-Do List',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              )),
              Gap(16.h),
          SizedBox(
              width: 255.w,
              height: 72.h,
              child: Text(
                'This productive tool is designed to help you better manage your task project-wise conveniently!',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xff6E6A7C)),
                textAlign: TextAlign.center,
              )),
              SizedBox(
                width: 331.w,
          height: 49.h,
          
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:WidgetStatePropertyAll(Color(0xff5F33E1)) ,
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)))
                  ),
                onPressed: (){
                  
                }, 
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Let\'s Start', style: TextStyle(color: Colors.white, fontSize: 19 , fontWeight: FontWeight.w700),),
                    Gap(8.w),
                    SvgPicture.asset('assets/images/arrow_left.svg',
                    )
                  ],
                )
                ),
              ),
                ],
              ),
        ));
  }
}
