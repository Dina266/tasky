import 'package:flutter/material.dart';

class CustomEditTextFormField extends StatelessWidget {
  const CustomEditTextFormField({super.key, required this.controller, required this.hintTxt, this.initialVal, this.maxLines, this.suffixIcon} );
  final TextEditingController controller;
  final String? initialVal;
  final String hintTxt;
  final int? maxLines;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color :Color(0xff5F33E1)
        ),
      controller: controller,
      initialValue: initialVal,
      maxLines: maxLines,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        fillColor: Colors.transparent,
        contentPadding: EdgeInsets.symmetric(horizontal:17 ,vertical: 5),
        hintText: hintTxt,
        hintStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color :Colors.black.withOpacity(0.3)
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(width: 1,color: Colors.black.withOpacity(0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(width: 1,color: Colors.black.withOpacity(0.3)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(width: 1,color: Colors.black.withOpacity(0.3)),
        ),
      ),

    );
  }
}