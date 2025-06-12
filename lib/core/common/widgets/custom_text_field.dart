

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';

import '../../utils/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.readOnly = false, this.prefixIcon,
   this.fillColor, this.maxLine =1,this.radius = 8, // Default to TextInputType.text
  });

  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final dynamic fillColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool readOnly;
  final int maxLine;
  final double radius;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLine,
      onTapOutside: (n){
        FocusScope.of(context).unfocus();
      },
      readOnly: readOnly,
      keyboardType: keyboardType, // Use optional keyboard type
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintStyle: GoogleFonts.dmSans(
          color: AppColors.textSecondary,
          fontWeight: FontWeight.w400,
          fontSize: 14.sp,
          height: 20 / 14,

        ),
        fillColor:fillColor ?? Colors.transparent, // Make background transparent
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.borderColor, width: 0.5),
          borderRadius: BorderRadius.circular(radius)
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primary, width: 0.5),
            borderRadius: BorderRadius.circular(radius)
        ),
        contentPadding: EdgeInsets.only(left: 12.w,right: 10.w,top: 12.h,bottom: 12.h),
      ),
      validator: validator,
    );
  }
}
