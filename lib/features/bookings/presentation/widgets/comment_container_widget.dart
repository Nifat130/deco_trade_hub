

import 'package:flutter/cupertino.dart';

import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_sizes.dart';
import '../../../../core/utils/constants/image_path.dart';

Widget commentContainer(){

  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(getWidth(4)),
        border: Border.all(color: Color(0xFFD9D9D9)),
        color: Color(0xFFF9F9FB)
    ),
    padding: EdgeInsets.symmetric(horizontal: getWidth(8), vertical:  getHeight(8)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(ImagePath.profile),
        Padding(
          padding: EdgeInsets.only(left: getWidth(8)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: "Nifat Chowdhury  ⭐5",),
              SizedBox(
                width: 250,
                child: CustomText(text: "Great product, fast turnaround! Highly recommended", textOverflow: TextOverflow.ellipsis, fontWeight: FontWeight.w500, maxLines: 2,),
              ),
              GestureDetector(
                onTap: (){},
                child: CustomText(text: "Edit", fontWeight: FontWeight.w700, color: AppColors.primary, decoration: TextDecoration.underline,),
              )
            ],
          ),
        )
      ],
    ),
  );
}