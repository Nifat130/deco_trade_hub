
import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../routes/app_routes.dart';

Widget listViewer(List<Map<String, dynamic>> dataList) {
  return SizedBox(
    height: (300),
    width: double.infinity,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: dataList.length,
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      itemBuilder: (context, index) {
        final item = dataList[index];
        return GestureDetector(
          onTap: (){
            Get.toNamed(AppRoute.loginScreen);
          },
          child: SizedBox(
            width: 160.w,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  item['image'],
                  SizedBox(height: 5.h),
                  GestureDetector(
                    onTap: () {},
                    child: CustomText(
                      text: item["name"],
                      textOverflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  CustomText(
                    text: item["description"],
                    maxLines: 2,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}
