import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/common/widgets/clickable_message.dart';
import '../../../../core/common/widgets/custom_activity_header.dart';
import '../../../../core/common/widgets/custom_outline_button.dart';
import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_sizes.dart';
import '../../../../core/utils/constants/image_path.dart';
import '../../controllers/business_booking_details_controller.dart';

class BusinessBookingDetailsScreen extends GetView<BusinessBookingDetailsController> {
  const BusinessBookingDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customActivityHeader("Booking Details", "13"),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        flex: 2,
                        child: Image.asset(
                          ImagePath.profileImage,
                          fit: BoxFit.fill,
                          height: 44.h,
                          width: 44.w,
                        ),
                      ),
                      Flexible(
                        flex: 8,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: "Nifat Chowdhury",
                                fontSize: 16.w,
                                fontWeight: FontWeight.w600,
                              ),
                              CustomText(
                                text: "Order Time: July 6, 2025 - 2:00 PM",
                                fontSize: 14.w,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textSecondary,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 24.h),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.h),
                      border: Border.all(color: Color(0xFFD9D9D9)),
                      color: Color(0xFFF9F9FB),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "China Red Velvet Curtain",
                                  fontSize: 16.w,
                                ),
                                SizedBox(height: 4.h),
                                Row(
                                  children: [
                                    CustomText(text: "Current Status: "),
                                    Obx(() => CustomText(
                                      text: controller.statusMessage.value,
                                      color: controller.color,
                                    )),
                                  ],
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: CustomText(
                                text: "৳80",
                                fontSize: 20.w,
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          child: Divider(),
                        ),
                        Row(
                          children: [
                            Icon(Icons.email_outlined, size: 22.h),
                            SizedBox(width: 4.w),
                            CustomText(
                              text: "dpb@email.com",
                              color: AppColors.textSecondary,
                              fontSize: 15.w,
                              fontWeight: FontWeight.w500,
                            )
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            Icon(Icons.phone, size: 22.h),
                            SizedBox(width: 4.w),
                            CustomText(
                              text: "+880 1710291695",
                              color: AppColors.textSecondary,
                              fontSize: 15.w,
                              fontWeight: FontWeight.w500,
                            )
                          ],
                        ),
                        SizedBox(height: 8.h),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Retailer Notes: ',
                                style: GoogleFonts.inter(
                                  fontSize: 15.w,
                                  color: AppColors.textPrimary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: 'Please ensure the cloth quality is original.',
                                style: GoogleFonts.inter(
                                  fontSize: 15.w,
                                  color: AppColors.textSecondary,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16.h),

                        // Pending State
                        Obx(() => controller.status.value == BookingStatus.pending
                            ? Row(
                          children: [
                            Flexible(
                              flex: 29,
                              child: CustomOutlineButton(
                                onPressed: () {
                                  Get.back();
                                },
                                text: "Reject",
                                borderColor: AppColors.borderColor,
                                color: Colors.red,
                              ),
                            ),
                            Flexible(flex: 1, child: SizedBox()),
                            Flexible(
                              flex: 28,
                              child: CustomOutlineButton(
                                onPressed: () {
                                  controller.statusProgress();
                                },
                                text: "Accept",
                                borderColor: AppColors.borderColor,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        )
                            : SizedBox()),

                        // In Progress
                        Obx(() => controller.status.value == BookingStatus.progress &&
                            !controller.waiting.value
                            ? CustomOutlineButton(
                          onPressed: () {
                            controller.waiting.value = true;
                          },
                          text: "Given to delivery",
                          borderColor: AppColors.borderColor,
                          color: AppColors.primary,
                        )
                            : SizedBox()),

                        // Waiting for Confirmation
                        Obx(() => controller.status.value == BookingStatus.progress &&
                            controller.waiting.value
                            ? CustomOutlineButton(
                          onPressed: () {
                            controller.statusCompleted();
                          },
                          text: "Waiting for retailer confirmation",
                          borderColor: AppColors.borderColor,
                          color: AppColors.textSecondary,
                        )
                            : SizedBox()),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),

                  // Completed with Review
                  Obx(() => controller.status.value == BookingStatus.completed
                      ? Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.h),
                      border: Border.all(color: Color(0xFFD9D9D9)),
                      color: Color(0xFFF9F9FB),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipOval(
                          child: Image.asset(ImagePath.profileImage, height: 30.h, width: 30.w,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(text: "Nifat Chowdhury  ⭐5"),
                              SizedBox(
                                width: 250.w,
                                child: CustomText(
                                  text:
                                  "Great product, fast turnaround! Highly recommended",
                                  textOverflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w500,
                                  maxLines: 2,
                                ),
                              ),
                              // GestureDetector(
                              //   onTap: () {
                              //     clickableMessage();
                              //   },
                              //   child: CustomText(
                              //     text: "Reply",
                              //     fontWeight: FontWeight.w700,
                              //     color: AppColors.primary,
                              //     decoration: TextDecoration.underline,
                              //     decorationThickness: 2,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                      : SizedBox()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
