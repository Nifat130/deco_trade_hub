
import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:deco_trade_hub/features/settings/presentation/widgets/setting_items.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/app_colors.dart';

Widget settingContainers(List list, String type, dynamic controller, BuildContext context){

  return Padding(
    padding: EdgeInsets.symmetric(vertical: 15.h),
    child: SizedBox(
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.borderColor),
            borderRadius: BorderRadius.circular(4.w)
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: type, color: AppColors.textSecondary,),
              ...list.map((row) => settingItems(row, controller, context)),
            ],
          ),
        ),
      ),
    ),
  );
}