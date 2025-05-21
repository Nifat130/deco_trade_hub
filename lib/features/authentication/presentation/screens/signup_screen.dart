import 'package:deco_trade_hub/core/common/widgets/custom_button.dart';
import 'package:deco_trade_hub/core/common/widgets/custom_text.dart';
import 'package:deco_trade_hub/core/common/widgets/custom_text_field.dart';
import 'package:deco_trade_hub/core/utils/constants/app_colors.dart';
import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:deco_trade_hub/core/utils/constants/icon_path.dart';
import 'package:deco_trade_hub/features/authentication/presentation/widgets/role_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Obx(() =>
                  roleContainer(controller, "Importer", controller.selectedRole.value == "Importer" ? IconPath.importerIcon : IconPath.importerBWIcon)
              ),
              Obx(() =>
                  roleContainer(controller, "Retailer", controller.selectedRole.value == "Retailer" ? IconPath.retailerIcon : IconPath.retailerBWIcon)
              ),
              Obx(() =>
                  roleContainer(controller, "Employee", controller.selectedRole.value == "Employee" ? IconPath.employeeIcon : IconPath.employeeBWIcon)
              ),
            ],
          ),
          SizedBox(height: 24.h,),
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
          CustomText(text: "Forgot password?", fontSize: 12.sp, fontWeight: FontWeight.w500,),
          SizedBox(height: 44.h,),
          CustomButton(onPressed: (){}, title: "Sign In"),
          SizedBox(height: 12.h,),
          CustomText(text: "By joining you agree to ours terms ot Service and Privacy Policy", textAlign: TextAlign.center, fontWeight: FontWeight.w400, fontSize: 14.sp, color: AppColors.textSecondary,),
          SizedBox(height: 44.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: "I don’t have a account? ", fontWeight: FontWeight.w400, fontSize: 14.sp, color: AppColors.textSecondary,),
              GestureDetector(
                onTap: (){},
                child: CustomText(text: "Sign up", fontWeight: FontWeight.w400, fontSize: 14.sp,),
              ),
            ],
          )
        ],
      ),
    );
  }
}
