import 'package:app_ui/app_ui.dart';
import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/icon_path.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final dynamic buttonColor, borderColor, iconColor; // Can be either Color or Gradient
  final Color buttonTextColor;
  final double radius, height;
  final FontWeight? fontWeight;
  final double? fontSize;
  final String title;
  final String? icon;
  final bool isIcon;
  final bool loading;

  const CustomButton({
    super.key,
    required this.onPressed,
    this.buttonColor = AppColors.primary,
    this.buttonTextColor = Colors.white,
    required this.title,
    this.borderColor,
    this.fontWeight,
    this.fontSize,
    this.isIcon = true,
    this.iconColor = AppColors.white,
    this.radius = 8,
    this.height = 44,
    this.icon,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: loading ? null : onPressed,
      child: Opacity(
        opacity: loading ? 0.9 : 1.0,
        child: Container(
          height: height,
          decoration: BoxDecoration(
            gradient: buttonColor is Gradient ? buttonColor : null,
            color: buttonColor is Color ? buttonColor : const Color(0xff403B3E),
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(
              width: 1,
              color: borderColor ?? AppColors.primary,
            ),
          ),
          child: Center(
            child: loading
                ? SizedBox(width: 24, height: 24, child: BaseLoaderWidget())
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.dmSans(
                          color: buttonTextColor,
                          fontWeight: fontWeight ?? FontWeight.w600,
                          fontSize: fontSize ?? 16.sp,
                          height: 22 / 16,
                          letterSpacing: -0.6,
                        ),
                      ),
                      if (isIcon == false) SizedBox(width: 12.w),
                      if (isIcon == false)
                        Image.asset(
                          icon ?? IconPath.arrowRight,
                          width: 17.w,
                          height: 12.h,
                          color: iconColor,
                        ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
