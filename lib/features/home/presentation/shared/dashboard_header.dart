import 'package:app_ui/app_ui.dart';
import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:deco_trade_hub/features/store/presentation/controllers/store_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/constants/app_colors.dart';
import '../../../../ui/nifat/widgets/custom_text.dart';
import 'custom_shimmers.dart';

class HomeDashboardHeader extends StatelessWidget {
  const HomeDashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoreController>(builder: (storeController) {
      if (storeController.store == null) return HomeHeaderShimmer();
      final store = storeController.store!;
      return SizedBox(
        width: double.infinity,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.primary,
            border: Border.all(color: AppColors.borderColor),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 50.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      flex: 2,
                      child: ClipOval(
                        child: ImageAttachmentThumbnail(
                          imageUrl: store.storeLogoUrl!,
                          fit: BoxFit.fill,
                          height: 44.h,
                          width: 44.w,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: store.storeName!,
                            color: AppColors.white,
                            fontSize: 16.w,
                          ),
                          Row(
                            children: [
                              CustomText(
                                text: "Premium member",
                                color: Colors.white70,
                                fontSize: 14.w,
                                fontWeight: FontWeight.w500,
                              ),
                              SizedBox(width: 10.w),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: SizedBox(
                        height: 44.h,
                        width: 44.w,
                        child: GestureDetector(
                          onTap: () {
                            //todo: Implement notification functionality
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.borderColor),
                              color: AppColors.white,
                            ),
                            child: Icon(
                              Icons.notifications_none_outlined,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // Search Bar
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.borderColor),
                      borderRadius: BorderRadius.circular(4),
                      color: AppColors.white,
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            //todo: Implement search functionality
                          },
                          icon: Icon(
                            Icons.search,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            onTap: () {
                              //todo: Implement search functionality
                            },
                            readOnly: true,
                            decoration: InputDecoration(
                              hintText: 'Search Businesses and Services',
                              hintStyle: TextStyle(color: AppColors.textSecondary),
                              border: InputBorder.none,
                            ),
                            style: GoogleFonts.poppins(
                              fontSize: 16.w,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
