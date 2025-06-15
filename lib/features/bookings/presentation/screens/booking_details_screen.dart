import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/common/widgets/custom_activity_header.dart';
import '../../../../core/common/widgets/custom_outline_button.dart';
import '../../../../core/common/widgets/custom_submit_button.dart';
import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/common/widgets/custom_textformfield.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/icon_path.dart';
import '../../../../core/utils/constants/image_path.dart';
import '../../controllers/booking_details_controller.dart';

class BookingDetailsScreen extends GetView<BookingDetailsController>{
  const BookingDetailsScreen({super.key});


  @override
  Widget build(BuildContext context) {

    return SafeArea(
      top: false,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customActivityHeader("Booking Details", "13"),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 2,
                          child: ClipOval(
                            child: Image.asset(ImagePath.profileImage, fit: BoxFit.fill, height: 44.h, width: 44.w,),
                          ),
                        ),
                        Flexible(
                          flex: 8,
                          child: SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.w),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(text: "Dhaka Parda Bitan", fontSize: 16.w, fontWeight: FontWeight.w600,),
                                  CustomText(text: "Order Time: Feb 6, 2025 - 2:00 PM", fontSize: 14.w, fontWeight: FontWeight.w500, color: AppColors.textSecondary,),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 24.h,),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.h),
                            border: Border.all(color: Color(0xFFD9D9D9)),
                            color: Color(0xFFF9F9FB)
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical:  8.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(text: "China Red Velvet Curtain", fontSize: 16.w,),
                                    SizedBox(height: 4.h,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CustomText(text: "Current Status: ",),
                                        Obx(() =>
                                            SizedBox(
                                              width: 145.w,
                                              child: CustomText(text: controller.statusMessage.value, color: controller.color,),
                                            ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: CustomText(text: "৳80", fontSize: 20.w,),
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 16.h),
                              child: Divider(),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.email_outlined, size: 22.h,),
                                SizedBox(width: 4.w,),
                                CustomText(text: "dpb@gmail.com", color: AppColors.textSecondary, fontSize: 15.w, fontWeight: FontWeight.w500,)
                              ],
                            ),
                            SizedBox(height: 8.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.phone, size: 22.h,),
                                SizedBox(width: 4.w,),
                                CustomText(text: "+880 1710291695", color: AppColors.textSecondary, fontSize: 15.w, fontWeight: FontWeight.w500,)
                              ],
                            ),
                            SizedBox(height: 8.h,),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Your Notes: ',
                                    style: GoogleFonts.inter(
                                        fontSize: 15.w,
                                        color: AppColors.textPrimary,
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Please ensure the curtain fabrics is original.',
                                    style: GoogleFonts.inter(
                                        fontSize: 15.w,
                                        color: AppColors.textSecondary,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 16.h,),
                            // Show the pending screen
                            Obx(() =>
                            controller.status.value == Status.pending ?
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(text: "Finalize Booking?", fontSize: 14.w),
                                SizedBox(height: 8.h,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      flex: 29,
                                      child: CustomOutlineButton(
                                        onPressed: (){
                                          Get.back();
                                        },
                                        text: "Cancel",
                                        borderColor: AppColors.borderColor,
                                        color: Colors.red,
                                      ),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      child: Container(),
                                    ),
                                    Flexible(
                                        flex: 28,
                                        child: CustomSubmitButton(
                                          onTap: (){
                                            controller.statusProgress();
                                          },
                                          text: "Book",
                                        )
                                    ),
                                  ],
                                )
                              ],
                            ) :
                            SizedBox()),
                            // Show the progress screen
                            Obx(() =>
                            controller.status.value == Status.progress ?
                            SizedBox() :
                            SizedBox()),

                            // show confirm screen
                            Obx(() =>
                            controller.status.value == Status.confirm && !(controller.contactSupport.value || controller.payment.value)?
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(text: "The business has marked your service as completed. Please verify.", fontSize: 14.w),
                                SizedBox(height: 8.h,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      flex: 29,
                                      child: CustomOutlineButton(
                                        onPressed: (){
                                          Get.back();
                                        },
                                        text: "Cancel",
                                        borderColor: AppColors.borderColor,
                                        color: Colors.red,
                                      ),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      child: Container(),
                                    ),
                                    Flexible(
                                        flex: 28,
                                        child: CustomSubmitButton(
                                          onTap: (){
                                            controller.payment.value = true;
                                          },
                                          text: "Confirm",
                                        )
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.h,),
                              ],
                            ) :
                            SizedBox()),
                            // show payment
                            Obx(() =>
                            controller.status.value == Status.confirm && controller.payment.value ?
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(text: "Selected a payment method", fontSize: 14.w),
                                SizedBox(height: 8.h,),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: AppColors.borderColor),
                                      borderRadius: BorderRadius.circular(4.h),
                                      color: Colors.white
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(IconPath.paymentIcon),
                                      SizedBox(width: 8.w,),
                                      CustomText(text: "**** **** **** 0692", )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 8.h,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      flex: 29,
                                      child: CustomOutlineButton(
                                        onPressed: (){
                                          controller.payment.value = false;
                                        },
                                        text: "Cancel",
                                        borderColor: AppColors.borderColor,
                                        color: Colors.red,
                                      ),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      child: Container(),
                                    ),
                                    Flexible(
                                        flex: 28,
                                        child: CustomSubmitButton(
                                          onTap: (){
                                            controller.statusCompleted();
                                          },
                                          text: "Proceed",
                                        )
                                    ),
                                  ],
                                )
                              ],
                            ) :
                            SizedBox()),
                            // Show the completed screen
                            Obx(() =>
                            controller.status.value == Status.completed && !controller.review.value?
                            GestureDetector(
                              onTap: (){
                                controller.review.value = true;
                              },
                              child: CustomText(text: "Leave a review", fontWeight: FontWeight.w700, color: AppColors.primary, decoration: TextDecoration.underline,),
                            ) :
                            SizedBox()),

                            // Show leave a review
                            Obx(() =>
                            controller.status.value == Status.completed && controller.review.value ?
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(text: "Leave a review", fontSize: 14.w),
                                SizedBox(height: 8.h,),
                                CustomTextFormField(
                                  controller: controller.supportTEController,
                                  hintText: "Write a review",
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.borderColor),
                                  ),
                                  maxLines: 3,
                                ),
                                SizedBox(height: 8.h,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        controller.review.value = false;
                                      },
                                      child: Image.asset(IconPath.crossButton, fit: BoxFit.fill,),
                                    ),
                                    SizedBox(width: 8.w,),
                                    GestureDetector(
                                      onTap: (){
                                        controller.review.value = false;
                                        controller.hasReview.value = true;
                                      },
                                      child: Image.asset(IconPath.forwardButton, fit: BoxFit.fill,),
                                    ),
                                  ],
                                )
                              ],
                            ) :
                            SizedBox()),

                          ],
                        )
                    ),
                    SizedBox(height: 16.h,),
                    Obx(() =>
                    controller.status.value == Status.completed && controller.hasReview.value ?
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.h),
                          border: Border.all(color: Color(0xFFD9D9D9)),
                          color: Color(0xFFF9F9FB)
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical:  8.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(ImagePath.profileImage),
                          Padding(
                            padding: EdgeInsets.only(left: 8.w),
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
                    ) : SizedBox()
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
}