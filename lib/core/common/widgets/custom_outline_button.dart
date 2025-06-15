import 'package:deco_trade_hub/core/common/widgets/custom_text.dart';
import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/app_colors.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({
    super.key,
    this.text,
    this.icon,
    this.color,
    this.borderColor,
    this.containerWidth,
    this.fontSize,
    this.containerPadding,
    required this.onPressed,
  });

  final String? text;
  final Widget? icon;
  final Color? color;
  final Color? borderColor;
  final double? containerWidth;
  final double? fontSize;
  final EdgeInsetsGeometry? containerPadding;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(12),
      color: Colors.white,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        splashColor: Colors.white.withOpacity(0.5),
        onTap: onPressed,
        child: Container(
          width: containerWidth,
          padding: containerPadding ?? EdgeInsets.symmetric(vertical: 17.h, horizontal: 16.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: borderColor ?? AppColors.primary),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                const SizedBox(),
                SizedBox(
                  height: 23.h,
                  width: 23.w,
                  child: icon!,
                ),
              ],
              CustomText(
                text: text ?? '',
                fontSize: fontSize ?? 16.w,
                fontWeight: FontWeight.w600,
                color: color ?? AppColors.primary,
              )
            ],
          ),
        ),
      ),
    );
  }
}
