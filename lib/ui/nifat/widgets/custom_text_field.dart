import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.prefixIcon,
    this.fillColor,
    this.maxLine = 1,
    this.radius = 8,
    this.numericOnly = false,
    this.numericOnlyWithDecimal = false,
    this.expands = false,
  });

  final bool numericOnly;
  final bool numericOnlyWithDecimal;
  final bool expands;
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
    List<TextInputFormatter>? inputFormatters;
    if (numericOnly) {
      inputFormatters = [FilteringTextInputFormatter.digitsOnly];
    } else if (numericOnlyWithDecimal) {
      inputFormatters = [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))];
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          maxLines: expands ? null : maxLine,
          minLines: expands ? null : 1,
          readOnly: readOnly,
          keyboardType: keyboardType,
          obscureText: obscureText,
          controller: controller,
          inputFormatters: inputFormatters,
          validator: validator,
          style: GoogleFonts.dmSans(
            fontSize: 14.sp,
            color: AppColors.textPrimary,
          ),
          decoration: InputDecoration(
            isDense: true,
            hintText: hintText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hintStyle: GoogleFonts.dmSans(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              height: 20 / 14,
            ),
            errorStyle: GoogleFonts.dmSans(
              color: AppColors.error,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              height: 16 / 12,
            ),
            errorMaxLines: 2,
            fillColor: fillColor ?? Colors.transparent,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.borderColor, width: 0.5),
              borderRadius: BorderRadius.circular(radius),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.borderColor, width: 0.5),
              borderRadius: BorderRadius.circular(radius),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.error, width: 0.5),
              borderRadius: BorderRadius.circular(radius),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.error, width: 0.5),
              borderRadius: BorderRadius.circular(radius),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 12.h,
            ),
          ),
        ),

        // Reserve space below for consistent layout (even if no error yet)
        SizedBox(height: 4.h), // Add spacing for visual buffer
      ],
    );
  }
}
