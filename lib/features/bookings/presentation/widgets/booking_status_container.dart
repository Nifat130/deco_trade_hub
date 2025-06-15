import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/icon_path.dart';
import '../../../../core/utils/constants/image_path.dart';
import '../../../../routes/app_routes.dart';

Widget statusContainer(Map<String, dynamic> list, String role) {
  return Padding(
    padding: EdgeInsets.only(bottom: 16.h),
    child: GestureDetector(
      onTap: () {
        if (role == "Importer") {
          Get.toNamed(AppRoute.businessBookingDetailsScreen, arguments: list['status']);
        } else {
          Get.toNamed(AppRoute.bookingDetailsScreen, arguments: list['status']);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.borderColor),
          borderRadius: BorderRadius.circular(4.w),
        ),
        padding: EdgeInsets.all(8.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                  text: "China Red Velvet Curtain",
                  fontWeight: FontWeight.w600,
                  fontSize: 14.w,
                ),
                Icon(Icons.arrow_forward_sharp, color: Color(0xFF2972FF)),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 1,
                  child: ClipOval(
                    child: Image.asset(ImagePath.profileImage, fit: BoxFit.fill),
                  ),
                ),
                Flexible(
                  flex: 7,
                  child: SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "TechFix Solutions",
                            fontSize: 14.w,
                            fontWeight: FontWeight.w600,
                          ),
                          CustomText(
                            text: "-5 January, 2024",
                            fontSize: 14.w,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textSecondary,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Image.asset(
                    list['status'] == "Pending"
                        ? IconPath.pendingIcon
                        : list['status'] == "Completed"
                        ? IconPath.completedImage
                        : IconPath.progressIcon,
                    fit: BoxFit.fill,
                    height: 29.h,
                    width: 86.w,
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
