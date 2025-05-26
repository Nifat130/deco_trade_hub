import 'package:deco_trade_hub/core/common/widgets/custom_button.dart';
import 'package:deco_trade_hub/core/common/widgets/custom_text.dart';
import 'package:deco_trade_hub/core/common/widgets/custom_text_field.dart';
import 'package:deco_trade_hub/core/utils/constants/app_colors.dart';
import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:deco_trade_hub/features/authentication/controllers/common_controller.dart';
import 'package:deco_trade_hub/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  LoginScreen({super.key});
  final commonController = Get.put(CommonController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(text: "Welcome Back 👋", fontWeight: FontWeight.w700, fontSize: 24.sp,),
          SizedBox(height: 8.h,),
          CustomText(text: "We happy to see you again! to use your account, you should sign in first.", fontWeight: FontWeight.w400, fontSize: 14.sp,),
          SizedBox(height: 32.h,),
          CustomTextField(
              controller: controller.email,
              hintText: "Enter your email",
            prefixIcon: Icon(Icons.email_outlined),
          ),
          SizedBox(height: 16.h,),
          CustomTextField(
            controller: controller.password,
            hintText: "Enter your password",
            prefixIcon: Icon(Icons.lock_outline),
          ),
          SizedBox(height: 12.h,),
          GestureDetector(
            onTap: (){
              Get.toNamed(AppRoute.forgetPasswordScreen);
            },
            child: CustomText(text: "Forgot password?", fontSize: 12.sp, fontWeight: FontWeight.w500,),
          ),
          SizedBox(height: 44.h,),
          CustomButton(
              onPressed: (){
                Get.toNamed(AppRoute.bottomNevScreen);
              },
              title: "Sign In"
          ),
          SizedBox(height: 12.h,),
          CustomText(text: "By joining you agree to ours terms ot Service and Privacy Policy", textAlign: TextAlign.center, fontWeight: FontWeight.w400, fontSize: 14.sp, color: AppColors.textSecondary,),
        ],
      ),
    );
  }
}
