import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/constants/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget? suffixIcon;
  final String? prefixIconPath;
  final ValueChanged<String>? onChanged;
  final bool readonly;
  final bool obscureText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final int? maxLines;
  final InputBorder? focusedBorder;
  final Color? containerColor;
  final Color? containerBorderColor;
  final Color? hintTextColor;  // Color for hint text
  final double? hintTextSize;  // Font size for hint text
  final String? suffixText;    // Text for suffix
  final TextStyle? suffixTextStyle; // Style for suffix text
  final String? Function(String?)? validator; // Nullable validator function

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.suffixIcon,
    this.readonly = false,
    this.prefixIconPath,
    this.maxLines = 1,
    this.onChanged,
    this.containerBorderColor,
    this.obscureText = false,
    this.keyboardType,
    this.inputFormatters,
    this.border,
    this.enabledBorder = InputBorder.none,
    this.focusedBorder = InputBorder.none,
    this.containerColor,
    this.hintTextColor = AppColors.textSecondary, // Default color
    this.hintTextSize = 15, // Default font size
    this.suffixText,  // Nullable suffix text
    this.suffixTextStyle, // Nullable suffix text style
    this.validator, // Nullable validator function
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      decoration: BoxDecoration(
        color: containerColor ?? Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextFormField(
        controller: controller,
        readOnly: readonly,
        obscureText: obscureText,
        maxLines: maxLines,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        style: GoogleFonts.poppins(
            fontSize: 16.h,
            fontWeight: FontWeight.w400,
            color: AppColors.textPrimary),
        validator: validator, // Use the passed validator function here
        autovalidateMode:AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          prefixIcon: prefixIconPath != null
              ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: 20.h),
              Image.asset(
                prefixIconPath!,
                height: 26.h,
                width: 26.h,
              ),
              SizedBox(width: 10.h),
            ],
          )
              : null,
          suffixIcon: suffixIcon,
          suffixText: suffixText, // Dynamic suffixText
          suffixStyle: suffixTextStyle ??
              GoogleFonts.poppins(
                fontSize: 12.h, // Default size for the suffix text
                fontWeight: FontWeight.w400,
                color: AppColors.textSecondary, // Default color for the suffix text
              ),
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
            fontSize: hintTextSize ?? 15.sp, // Use dynamic size, default to 15
            fontWeight: FontWeight.w400,
            color: hintTextColor ?? AppColors.textSecondary, // Use dynamic color, default to textSecondary
          ),
          border: border ?? OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: AppColors.borderColor)
          ),
          focusedBorder: border,
          focusedErrorBorder: border,
          enabledBorder: border,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        ),
      ),
    );
  }
}
