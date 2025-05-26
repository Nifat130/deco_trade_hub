import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/constants/app_colors.dart';

class CustomSubmitButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Widget? prefixIcon;
  final Widget? nextIcon;
  final Widget? child; // Added child parameter
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final Color? color; // Added color parameter (button color)
  final Color? textColor; // Added textColor parameter (text color)

  const CustomSubmitButton({
    super.key,
    required this.text,
    required this.onTap,
    this.prefixIcon,
    this.nextIcon,
    this.child, // Child widget is passed as an optional parameter
    this.padding,
    this.borderRadius,
    this.color, // Optional color parameter
    this.textColor, // Optional text color parameter
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color ?? AppColors.primary, // Use the provided color or the default color
      borderRadius: borderRadius ?? BorderRadius.circular(4),
      child: InkWell(
        splashColor: Colors.white.withAlpha(13),
        borderRadius: borderRadius ?? BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: padding ?? EdgeInsets.symmetric(vertical: 17.h),
          decoration: BoxDecoration(
            borderRadius: borderRadius ?? BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (prefixIcon != null) ...[
                const SizedBox(),
                SizedBox(
                  height: 22.h,
                  width: 22.w,
                  child: prefixIcon!,
                ),
              ],
              SizedBox(width: 8.w),
              // Display text if no child is passed
              if (child == null) ...[
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 16.w,
                    fontWeight: FontWeight.w600,
                    color: textColor ?? AppColors.white, // Use the provided text color or the default color
                  ),
                ),
              ],
              // Display child if passed
              if (child != null) ...[
                child!,
              ],
              if (nextIcon != null) ...[
                SizedBox(
                  width: 25.w,
                  child: nextIcon!,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
