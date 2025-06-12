import 'dart:io';

import 'package:deco_trade_hub/core/common/widgets/without_notification_custom_header.dart';
import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:deco_trade_hub/core/utils/constants/icon_path.dart';
import 'package:deco_trade_hub/core/utils/constants/image_path.dart';
import 'package:deco_trade_hub/features/profile/controllers/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/common/widgets/custom_activity_header.dart';
import '../../../../core/common/widgets/custom_button.dart';
import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/common/widgets/custom_text_field.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../routes/app_routes.dart';

class EditProfileScreen extends GetView<EditProfileController>{
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            withoutNotificationCustomHeader("Edit Profile"),
            SizedBox(height: 30.h,),
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.h),
                  child: ClipOval(
                    child: Obx(() =>
                      controller.changedImage.value == "" ?
                      Image.asset(ImagePath.profileImage, fit: BoxFit.fill, height: 100.h, width: 100.w,) :
                      Image.file(File(controller.changedImage.value), fit: BoxFit.fill, height: 100.h, width: 100.w,)
                    ),
                  ),
                ),
                Positioned(
                  bottom: 1.h,
                  right: 2.w,
                  child: GestureDetector(
                    onTap: (){
                      controller.pickNewPicture();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.white,
                        border: Border.all(color: AppColors.primary)
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
                      child: Icon(Icons.add_a_photo, color: AppColors.primary, size: 16.h,),
                    ),
                  )
                  
                )
              ],
            ),
            SizedBox(height: 20.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    controller: controller.businessNameTEController,
                    hintText: "Dhaka Parda Bitan",
                    prefixIcon: Icon(Icons.home),
                  ),
                  SizedBox(height: 16.h,),
                  CustomTextField(
                    controller: controller.locationTEController,
                    hintText: "West Shewrapara, Mirpur, Dhaka-1216",
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
                    hintText: "Nifat Chowdhury",
                    prefixIcon: Icon(Icons.person),
                  ),
                  SizedBox(height: 16.h,),
                  CustomTextField(
                    controller: controller.ownerPhoneTEController,
                    hintText: "+880 1710291695",
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
                    hintText: "Dhaka Parda Bitan is an amazing shop located in Mirpur, Dhaka",
                    maxLine: 4,
                  ),
                  SizedBox(height: 32.h,),
                  CustomButton(
                    onPressed: (){
                      Get.back();
                    },
                    title: "Save Changes",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
