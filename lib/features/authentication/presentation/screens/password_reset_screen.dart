import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/common/widgets/custom_submit_button.dart';
import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../routes/app_routes.dart';
import '../../controllers/password_reset_controller.dart';
import '../widgets/passsword_inputtext_textformfield.dart';

class PasswordResetScreen extends StatelessWidget {
  PasswordResetScreen({super.key});

  final PasswordResetController passwordResetController = Get.put(PasswordResetController());
  final userRole = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 70.h,),
              CustomText(text: 'DecoTradeHub', fontSize: 24.w,fontWeight: FontWeight.w700, color: AppColors.primary,),
              SizedBox(height: 15.h,),
              CustomText(text: 'Password reset', fontSize: 32.w,fontWeight: FontWeight.w700, color: AppColors.textPrimary,),
              SizedBox(height: 15.h,),
              CustomText(text: "Please enter the OTP that has been sent to your registered email address.", fontSize: 14.w, color: AppColors.textSecondary,),
              SizedBox(height: 80.h,),
              CustomText(text: "New Password", fontSize: 14.w, color: AppColors.textPrimary,),
              Obx(() => passwordInputTextTextformfield(passwordResetController.newpassvisibility.value, passwordResetController.newpass.value, "Enter your new password", passwordResetController.toggleNewpassVisiblity)),
              SizedBox(height: 15.h,),
              CustomText(text: "Confirm Password", fontSize: 14.w, color: AppColors.textPrimary,),
              Obx(() => passwordInputTextTextformfield(passwordResetController.confirmpassvisibility.value, passwordResetController.confirmpass.value, "Confirm your password", passwordResetController.toggleConfirmpassVisiblity)),
              SizedBox(height: 15.h,),
              Spacer(),
              CustomSubmitButton(text: "Reset Password", onTap: (){Get.offNamed(AppRoute.loginScreen, arguments: userRole);}, borderRadius: BorderRadius.circular(4),),
            ],
          ),
        ),
      ),
    );
  }
}
