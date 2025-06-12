import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_sizes.dart';
import '../../../../core/utils/constants/image_path.dart';
import '../../../../routes/app_routes.dart';

Widget uploadsItem(Map<String, dynamic> item) {
  return GestureDetector(
    onTap: () {
      // Handle tap
    },
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          item['image'],
          fit: BoxFit.fill,
          height: 190.h,
          width: 160.w,
        ),
        SizedBox(height: 8.h),
        CustomText(
          text: item['time'],
          color: AppColors.textSecondary,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(height: 4.h),
        CustomText(
          text: item['description'],
          maxLines: 2,
          textOverflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );
}
