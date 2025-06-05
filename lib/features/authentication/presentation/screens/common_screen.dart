import 'package:deco_trade_hub/core/common/widgets/custom_text.dart';
import 'package:deco_trade_hub/features/authentication/presentation/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:deco_trade_hub/features/authentication/controllers/common_controller.dart';


import '../../../../core/common/widgets/custom_button.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/icon_path.dart';
import '../widgets/role_container.dart';
import 'login_screen.dart';

class CommonScreen extends GetView<CommonController> {
  const CommonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8.h,),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.h),
                        color: AppColors.borderColor
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(5.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                              flex: 1,
                              child: Obx(() => controller.isSelected.value == "Login" ?
                                  CustomButton(
                                      onPressed: (){},
                                      title: "Login",
                                      radius: 50
                                  ) :
                                  CustomButton(
                                    onPressed: (){
                                      controller.isSelected.value = "Login";
                                    },
                                    title: "Login",
                                    buttonTextColor: AppColors.textSecondary,
                                    radius: 50,
                                    buttonColor: AppColors.borderColor,
                                    borderColor: AppColors.borderColor,
                                  )
                              )
                          ),
                          Flexible(
                              flex: 1,
                              child: Obx(() => controller.isSelected.value == "Sign Up" ?
                              CustomButton(
                                  onPressed: (){},
                                  title: "Sign Up",
                                  radius: 50
                              ) :
                              CustomButton(
                                onPressed: (){
                                  controller.isSelected.value = "Sign Up";
                                },
                                title: "Sing Up",
                                buttonTextColor: AppColors.textSecondary,
                                radius: 50,
                                buttonColor: AppColors.borderColor,
                                borderColor: AppColors.borderColor,
                              )
                              )
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 44.h,),
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
                  Obx(() =>
                    controller.isSelected.value == "Login" ?
                    LoginScreen() :
                    SignupScreen()
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


