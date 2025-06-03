import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../controllers/notification_controller.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});
  final NotificationController notificationController = NotificationController();
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
              SizedBox(
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
                              CustomText(text: "Notifications", fontWeight: FontWeight.w600, fontSize: 20.sp, color: AppColors.white,),
                              // Spacer(),
                              // Stack(
                              //   children: [
                              //     SizedBox(
                              //         height: 44.h,
                              //         width: 44.w,
                              //         child: GestureDetector(
                              //           onTap: (){
                              //
                              //           },
                              //           child: Container(
                              //             decoration: BoxDecoration(
                              //               border: Border.all(color: AppColors.borderColor),
                              //               color: AppColors.primary,
                              //             ),
                              //             child: Icon(Icons.notifications_none_outlined, color: AppColors.primary,),
                              //           ),
                              //         )
                              //     ),
                              //     Positioned(
                              //       top: 19.5.h,
                              //       right: 9.5.w,
                              //       child: SizedBox(
                              //         height: 13.h,
                              //         width: 13.w,
                              //         child: Container(
                              //           decoration: BoxDecoration(
                              //             borderRadius: BorderRadius.circular(4),
                              //             color: Colors.red
                              //           ),
                              //           child: Center(child: CustomText(text: notificationController.notificationList.length.toString(), color: AppColors.primary, fontSize: 8.sp,)),
                              //         ),
                              //       ),
                              //     )
                              //   ],
                              // )
                            ],
                          ),
                        ),
                        SizedBox(height: 10.h,)
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 10.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: (){

                      },
                      child: CustomText(text: "Mark all as read", color: AppColors.primary, decoration: TextDecoration.underline,fontWeight: FontWeight.w700,),
                    ),
                    ...notificationController.notificationList.map((row) => SizedBox(
                      height: 100.h,
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                        child: Container(
                          decoration: BoxDecoration(
                            border: row['read'] ?  null : Border.all(color: AppColors.borderColor),
                            borderRadius: BorderRadius.circular(4)
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: SizedBox(
                                    height: 40.h,
                                    width: 40.w,
                                    child: row['icon'],
                                  ),
                                ),
                                Flexible(
                                    flex: 8,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                                      child: SizedBox(width: double.infinity, child: CustomText(text: row['description'], fontSize: 14.sp, fontWeight: FontWeight.w500, color: AppColors.textPrimary, maxLines: 3,)),
                                    )),
                                Flexible(
                                  flex: 1,
                                  child: GestureDetector(
                                    onTap: (){
                                      Get.snackbar("Message", "Yet to design the work");
                                    },
                                    child: Icon(Icons.arrow_forward_ios, color: AppColors.primary,),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
