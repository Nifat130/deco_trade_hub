
import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';
import '../../utils/constants/app_colors.dart';
import 'custom_text.dart';

Widget customActivityHeader(String title, String notificationCount){

  return SizedBox(
    height: 130.h,
    width: double.infinity,
    child: Container(
      decoration: BoxDecoration(
          color: AppColors.primary,
          border: Border.all(color: AppColors.borderColor)
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 50.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                      height: 44.h,
                      width: 44.w,
                      child: GestureDetector(
                        onTap: (){
                          Get.back();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.borderColor),
                            color: AppColors.white,
                          ),
                          child: Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.primary,),
                        ),
                      )
                  ),
                  SizedBox(width: 16.w,),
                  CustomText(text: title, fontWeight: FontWeight.w600, fontSize: 20.sp, color: AppColors.white,),
                  Spacer(),
                  Stack(
                    children: [
                      SizedBox(
                          height: 44.h,
                          width: 44.w,
                          child: GestureDetector(
                            onTap: (){
                              Get.toNamed(AppRoute.notificationScreen);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.borderColor),
                                color: AppColors.white,
                              ),
                              child: Icon(Icons.notifications_none_outlined, color: AppColors.primary,),
                            ),
                          )
                      ),
                      Positioned(
                        top: 19.5.h,
                        right: 9.5.w,
                        child: SizedBox(
                          height: 13.h,
                          width: 13.w,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.red
                            ),
                            child: Center(child: CustomText(text: notificationCount, color: AppColors.white, fontSize: 8.sp,)),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}