import 'dart:io';

import 'package:deco_trade_hub/core/common/widgets/custom_button.dart';
import 'package:deco_trade_hub/core/utils/constants/app_colors.dart';
import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:deco_trade_hub/core/utils/constants/image_path.dart';
import 'package:deco_trade_hub/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/common/widgets/custom_text_field.dart';
import '../../controllers/sing_up_controller.dart';

class SignupInformationScreen extends GetView<SingUpController> {
  const SignupInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: "Enter Your Business Information", fontWeight: FontWeight.w700, fontSize: 24.sp,),
                SizedBox(height: 16.h,),
                CustomText(text: "Create a secure account to access your personalized grief guide.", fontWeight: FontWeight.w400, fontSize: 14.sp,),
                SizedBox(height: 32.h,),
                Center(
                  child: SizedBox(
                    height: 102.h,
                    width: 102.w,
                    child: Stack(
                      children: [
                        Obx(() =>
                          controller.logoPath.value == '' ?
                          ClipOval(
                            child: Image.asset(ImagePath.dummyBusinessProfile, height: 100.h, width: 100.w, fit: BoxFit.fill, color: AppColors.textSecondary,),
                          ) :
                          ClipOval(
                            child: Image.file(File(controller.logoPath.value), height: 100.h, width: 100.w, fit: BoxFit.fill,),
                          )
                        ),
                        Positioned(
                          right: 0,
                          bottom: 5.h,
                          child: GestureDetector(
                            onTap: (){
                              controller.pickLogo();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.primary
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
                              child: Icon(Icons.add_a_photo, color: Colors.white,),
                            ),
                          )
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24.h,),
                CustomTextField(
                  controller: controller.businessNameTEController,
                  hintText: "Enter business name",
                  prefixIcon: Icon(Icons.home),
                ),
                SizedBox(height: 16.h,),
                CustomTextField(
                  controller: controller.locationTEController,
                  hintText: "Enter your business location",
                  prefixIcon: Icon(Icons.location_on_sharp),
                ),
                SizedBox(height: 16.h,),
                Obx(() =>
                    CustomTextField(
                      controller: controller.establishedTEController,
                      hintText: controller.establishedDate.value,
                      readOnly: true,
                      prefixIcon: GestureDetector(
                        onTap: (){
                          controller.pickDate(context);
                        },
                        child: Icon(Icons.calendar_month),
                      ),
                    )
                ),
                SizedBox(height: 16.h,),
                CustomTextField(
                  controller: controller.ownerNameTEController,
                  hintText: "Enter business owner name",
                  prefixIcon: Icon(Icons.person),
                ),
                SizedBox(height: 16.h,),
                CustomTextField(
                  controller: controller.ownerPhoneTEController,
                  hintText: "Enter your owner phone",
                  prefixIcon: Icon(Icons.phone),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 16.h,),
                GestureDetector(
                  onTap: (){
                    controller.pickLicence();
                  },
                  child: Obx(() =>
                    controller.licencePath.value == '' ?
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.sp),
                          color: Colors.white,
                          border: Border.all(color: AppColors.borderColor, width: 2)
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 24.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.file_open_sharp, color: AppColors.textSecondary,),
                          SizedBox(height: 8.h,),
                          CustomText(text: "Upload your licence", fontSize: 18.sp, color: AppColors.textSecondary,)
                        ],
                      ),
                    ) :
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.sp),
                          child: Image.file(File(controller.licencePath.value), width: double.infinity, height: 150.h, fit: BoxFit.fill,),
                        )
                  ),
                ),
                SizedBox(height: 16.h,),
                CustomTextField(
                  controller: controller.aboutTEController,
                  hintText: "Tell something about your business...",
                  maxLine: 4,
                ),
                SizedBox(height: 32.h,),
                CustomButton(
                  onPressed: (){
                    Get.toNamed(AppRoute.loginScreen);
                  },
                  title: "Create Account",
                ),
                SizedBox(height: 16.h,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
