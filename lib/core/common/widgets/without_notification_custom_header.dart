

import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/constants/app_colors.dart';
import 'custom_text.dart';

Widget withoutNotificationCustomHeader(String title){

  return SizedBox(
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
                ],
              ),
            ),
            SizedBox(height: 10.h,)
          ],
        ),
      ),
    ),
  );
}