import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.txt, required this.onPressed});
  final Widget txt;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
                width: 331.w,
          height: 49.h,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:WidgetStatePropertyAll(Color(0xff5F33E1)) ,
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)))
                  ),
                onPressed: onPressed, 
                child: txt
                ),
              );
  }
}