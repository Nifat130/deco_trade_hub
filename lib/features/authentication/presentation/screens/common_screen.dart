import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:deco_trade_hub/features/authentication/controllers/common_controller.dart';


import '../../../../core/common/widgets/custom_button.dart';
import '../../../../core/utils/constants/app_colors.dart';

import '../../../../core/utils/constants/logo_path.dart';
import '../../controllers/login_controller.dart';

class CommonScreen extends GetView<LoginController> {
  CommonScreen({super.key});

  final CommonController commonController = CommonController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                            child: Obx(() => commonController.isSelected.value == "Login" ?
                                CustomButton(
                                    onPressed: (){},
                                    title: "Login",
                                    radius: 50
                                ) :
                                CustomButton(
                                  onPressed: (){
                                    commonController.isSelected.value = "Login";
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
                            child: Obx(() => commonController.isSelected.value == "Sign Up" ?
                            CustomButton(
                                onPressed: (){},
                                title: "Sign Up",
                                radius: 50
                            ) :
                            CustomButton(
                              onPressed: (){
                                commonController.isSelected.value = "Sign Up";
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

              ],
            ),
          ),
        ),
      ),
    );
  }
}


