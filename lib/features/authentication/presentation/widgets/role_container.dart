
import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:deco_trade_hub/features/authentication/controllers/common_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/icon_path.dart';
import '../../controllers/login_controller.dart';

Widget roleContainer(CommonController controller, String roleName, String iconPath){
  return GestureDetector(
    onTap: (){
      controller.selectedRole.value = roleName;
    },
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 90.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.sp),
              color: controller.selectedRole.value == roleName ? AppColors.primary : AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(50),
                  spreadRadius: .2,
                  blurRadius: .2,
                  offset: const Offset(.2, .2),
                ),
              ]
          ),
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(iconPath, height: 45.h, width: 45.w,),
              SizedBox(height: 4.h,),
              CustomText(text: roleName, fontSize: 14.sp, fontWeight: FontWeight.w500, color: controller.selectedRole.value == roleName ? AppColors.white : AppColors.textPrimary,)
            ],
          ),
        ),
      ]
    ),
  );
}