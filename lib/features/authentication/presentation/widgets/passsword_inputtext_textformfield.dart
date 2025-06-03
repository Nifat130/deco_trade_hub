import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:flutter/material.dart';

import '../../../../core/common/widgets/custom_textformfield.dart';
import '../../../../core/utils/constants/app_colors.dart';
Widget passwordInputTextTextformfield(bool visibility, TextEditingController controller, String hint, Function event){

  return Padding(
    padding: EdgeInsets.only(top: 8.h),
    child: CustomTextFormField(
      controller: controller,
      obscureText: visibility,
      hintText: hint,
      hintTextSize: 14.w,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: AppColors.borderColor)
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: AppColors.borderColor)
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: AppColors.borderColor)
      ),
      suffixIcon: GestureDetector(
        onTap: (){
          event();
        },
        child: Icon(
            visibility ? Icons.visibility_outlined : Icons.visibility_off_outlined
        ),
      ),
    ),
  );
}