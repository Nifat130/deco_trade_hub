import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:deco_trade_hub/core/utils/constants/image_path.dart';
import 'package:deco_trade_hub/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/common/widgets/custom_activity_header.dart';
import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_sizes.dart';
import '../../controllers/feed_controller.dart';
import '../widgets/uploads_item.dart';

class FeedScreen extends GetView<FeedController>{
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customActivityHeader("Dhaka Parda Bitan", "13"),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipOval(
                    child: Image.asset(ImagePath.profileImage, fit: BoxFit.fill, height: 60.h, width: 60.w,),
                  ),
                  SizedBox(height: 16.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomText(text: "Dhaka Parda Bitan", fontSize: 16.w,),
                          SizedBox(width: 8.w,),
                          CustomText(text: "⭐(4.7/5)", fontSize: 16.w,),
                        ],
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.toNamed(AppRoute.editProfileScreen);
                        },
                        child: Icon(Icons.mode_edit_outline_outlined, color: AppColors.primary,),
                      )
                    ],
                  ),
                  SizedBox(height: 4.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.circle, color: Color(0xFF14C71A), size: 16.w,),
                      SizedBox(width: 4.w,),
                      CustomText(text: "Open Now", fontSize: 14.w, color: Color(0xFF14C71A),)
                    ],
                  ),
                  SizedBox(height: 4.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.contact_support_outlined, size: 16.w,),
                      SizedBox(width: 4.w,),
                      CustomText(text: "support@bpb.com | +888 01710291696", fontWeight: FontWeight.w500, color: AppColors.textSecondary,)
                    ],
                  ),
                  SizedBox(height: 4.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.add_location_outlined, size: 16.w,),
                      SizedBox(width: 4.w,),
                      CustomText(text: "West Shewrapara, Mirpur, Dhaka-1216", fontWeight: FontWeight.w500, color: AppColors.textSecondary,)
                    ],
                  ),
                  SizedBox(height: 16.h,),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.w),
                      border: Border.all(color: AppColors.borderColor),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(text: "Recent Uploads:", fontSize: 16.w,),
                        GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16.w,
                            mainAxisSpacing: 16.h,
                            childAspectRatio: 0.6,
                          ),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.uploadsList.length,
                          itemBuilder: (context, index){
                            final item = controller.uploadsList[index];
                            return uploadsItem(item);
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
