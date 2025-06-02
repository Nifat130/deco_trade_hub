
import 'package:deco_trade_hub/core/common/widgets/custom_outlined_button.dart';
import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/app_colors.dart' show AppColors;
import '../../../../routes/app_routes.dart';

Widget settingItems(Map<String, dynamic> row, dynamic controller, BuildContext context){
  return SizedBox(
    height: 60.h,
    width: double.infinity,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 2,
          child: SizedBox(
            height: 50.h,
            width: 50.w,
            child: row['icon'],
          ),
        ),
        Flexible(
            flex: 7,
            child: SizedBox(width: double.infinity, child: CustomText(text: row['description'], fontSize: 14.sp, fontWeight: FontWeight.w500, color: AppColors.textPrimary, maxLines: 3,))),
        row["navigate"] == "false" ?
        Flexible(
          flex: 1,
          child: Transform.scale(
            scaleY: 0.6,
            scaleX: 0.6,
            child: Obx(() =>
                Switch(
                  value: controller.twoStateVerify.value,
                  onChanged: (newValue){
                    controller.twoStateVerify.value = !controller.twoStateVerify.value;
                  },
                  activeTrackColor: AppColors.borderColor,
                  activeColor: AppColors.primary,
                )
            ),
          )
        ) :
        Flexible(
          flex: 1,
          child: GestureDetector(
            onTap: (){
              if(row["navigate"] != " "){
                if(row['navigate'] != AppRoute.loginScreen){
                  print("I am clicking here");
                  showDialog(
                      context: context,
                      builder: (context){
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.w),
                          ),
                          backgroundColor: Colors.white,
                          child: SizedBox(
                            width: double.infinity,
                            height: SizeUtils.height < 651 ? 280.w : 220.h,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(text: "Confirm Log Out", fontWeight: FontWeight.w600, fontSize: 20.sp, color: AppColors.textPrimary),
                                  SizedBox(height: 8.h,),
                                  CustomText(text: "Are you sure you want to log out? This action is irreversible.", fontWeight: FontWeight.w600, fontSize: 14.sp, color: AppColors.textPrimary,),
                                  SizedBox(height: 8.h,),
                                  CustomText(text: "You’ll need to sign in again to access your account and business dashboard.", fontWeight: FontWeight.w600, fontSize: 14.sp, color: AppColors.textSecondary,),
                                  Spacer(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        flex: 1,
                                        child: CustomOutlinedButton(
                                          onPressed: (){
                                            Get.back();
                                          },
                                          title: "Cancel",
                                          buttonTextColor: AppColors.primary,
                                          borderColor: AppColors.borderColor,
                                        ),
                                      ),
                                      SizedBox(width: 8.w,),
                                      Flexible(
                                        flex: 1,
                                        child: CustomOutlinedButton(
                                          onPressed: (){
                                            Get.offAllNamed(AppRoute.loginScreen);
                                          },
                                          icon: Icons.logout_outlined,
                                          title: "Log Out",
                                          buttonTextColor: Colors.red,
                                          borderColor: AppColors.borderColor,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                  );
                }
                else{
                  print("I am Clicking here in something wrong");
                  Get.toNamed(row["navigate"]);
                }
              }
              else{
                showDialog(
                    context: context,
                    builder: (context){
                      return Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.w),
                        ),
                        backgroundColor: Colors.white,
                        child: SizedBox(
                          height: SizeUtils.height < 651 ? 260.w : 200.h,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(text: "Confirm Account Deletion", fontWeight: FontWeight.w600, fontSize: 20.sp, color: AppColors.textPrimary),
                                SizedBox(height: 8.h,),
                                CustomText(text: "Are you sure you want to delete your account? This action is irreversible.", fontWeight: FontWeight.w600, fontSize: 14.sp, color: AppColors.textSecondary,),
                                SizedBox(height: 8.h,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CustomText(text: "⚠️ ", fontWeight: FontWeight.w600, fontSize: 16.sp, color: Colors.orange,),
                                    CustomText(text: "This cannot be undone", fontWeight: FontWeight.w600, fontSize: 14.sp, color: AppColors.textSecondary,),
                                  ],
                                ),
                                Spacer(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: CustomOutlinedButton(
                                        onPressed: (){
                                          Get.back();
                                        },
                                        title: "Cancel",
                                        buttonTextColor: AppColors.primary,
                                        borderColor: AppColors.borderColor,
                                      ),
                                    ),
                                    SizedBox(width: 4.w,),
                                    Flexible(
                                      flex: 2,
                                      child: CustomOutlinedButton(
                                        onPressed: (){
                                          Get.offAllNamed(AppRoute.loginScreen);
                                        },
                                        icon: Icons.delete_outline,
                                        title: "Delete My Account",
                                        buttonTextColor: Colors.red,
                                        borderColor: AppColors.borderColor,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                );
              }
            },
            child: Icon(Icons.arrow_forward_ios, color: AppColors.primary,),
          ),
        )
      ],
    ),
  );
}