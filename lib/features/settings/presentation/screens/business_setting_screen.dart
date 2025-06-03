import 'dart:io';


import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:deco_trade_hub/core/utils/constants/icon_path.dart';
import 'package:deco_trade_hub/core/utils/constants/image_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/common/widgets/backless_custom_activity_header.dart';
import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../controllers/business_setting_screen_controller.dart';
import '../widgets/setting_containers.dart';

class BusinessSettingScreen extends GetView<BusinessSettingScreenController> {
  const BusinessSettingScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            backlessCustomActivityHeader("Settings", "13"),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: (){
                          Get.snackbar("Me", "Me");
                        },
                        child: Stack(
                          children: [
                            Obx(() =>
                              controller.imagePath.value == "" ?
                              Image.asset(ImagePath.dummyBusinessProfile, height: 60.h, width: 60.w, fit: BoxFit.fill,) :
                              Image.file(File(controller.imagePath.value), height: 60.h, width: 60.w, fit: BoxFit.fill,)
                            ),
                            Positioned(
                                top: 32,
                                right: -4,
                                child: GestureDetector(
                                  onTap: (){
                                    controller.pickLogo();
                                  },
                                  child: Image.asset(IconPath.addPickIcon, height: 30.h, width: 30.w, fit: BoxFit.fill,),
                                )
                            )
                          ],
                        )
                    ),
                    SizedBox(height: 10.h,),
                    CustomText(text: "Dhaka Parda Bitan", fontWeight: FontWeight.w600, fontSize: 16.sp,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(text: "dpb@gmail.com", color: AppColors.textSecondary, fontSize: 14.sp, fontWeight: FontWeight.w500,),
                        SizedBox(width: 10.w,),
                        GestureDetector(
                          onTap: (){
                            Get.snackbar("me", "nifat");
                          },
                          child: CustomText(text: "(Upgrade)", color: AppColors.primary, fontSize: 14.sp, decoration: TextDecoration.underline, fontWeight: FontWeight.w700,),
                        )
                      ],
                    ),
                    settingContainers(controller.accountSettings, "Account Settings", controller, context),
                    settingContainers(controller.businessPreferenceSettings, "Business Preferences", controller, context),
                    settingContainers(controller.privacySettings, "Privacy & Security", controller, context)
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
