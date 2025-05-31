import 'package:deco_trade_hub/core/utils/constants/app_colors.dart';
import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:flutter/material.dart';

import '../../../../../ui/nifat/widgets/custom_button.dart';
import '../../../../../ui/nifat/widgets/custom_text.dart';
import '../../../../../ui/nifat/widgets/custom_text_field.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: "Create an Account",
            fontWeight: FontWeight.w700,
            fontSize: 24.sp,
          ),
          SizedBox(
            height: 8.h,
          ),
          CustomText(
            text: "Create a secure account to access your personalized grief guide.",
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
          ),
          SizedBox(
            height: 32.h,
          ),
          CustomTextField(
            controller: TextEditingController(),
            hintText: "Enter your name",
            prefixIcon: Icon(Icons.person),
          ),
          SizedBox(
            height: 16.h,
          ),
          CustomTextField(
            controller: TextEditingController(),
            hintText: "Enter your email",
            prefixIcon: Icon(Icons.email_outlined),
          ),
          SizedBox(
            height: 16.h,
          ),
          CustomTextField(
            controller: TextEditingController(),
            hintText: "Enter your password",
            prefixIcon: Icon(Icons.lock_outline),
          ),
          SizedBox(
            height: 44.h,
          ),
          CustomButton(
              onPressed: () {
                // commonController.selectedRole.value == 'Employee' ?
                // Get.toNamed(AppRoute.employeeSignupInformationScreen):
                // Get.toNamed(AppRoute.signupInformationScreen, arguments: commonController.selectedRole.value);
              },
              title: "Sign Up"),
          SizedBox(
            height: 12.h,
          ),
          CustomText(
            text: "By joining you agree to ours terms ot Service and Privacy Policy",
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
            color: AppColors.textSecondary,
          ),
        ],
      ),
    );
  }
}
