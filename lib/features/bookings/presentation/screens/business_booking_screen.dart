import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/common/widgets/backless_custom_activity_header.dart';
import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../controllers/business_booking_controller.dart';
import '../widgets/booking_status_container.dart';

class BusinessBookingScreen extends GetView<BusinessBookingController> {
  const BusinessBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          top: false,
          child: Column(
            children: [
              backlessCustomActivityHeader("Your Booking", "13"),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 20.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Manage Your bookings & Orders",
                        fontSize: 20.w,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(height: 8.h),
                      CustomText(
                        text:
                        "Keep track of your upcoming orders, past orders, and live updates in one place.",
                        fontSize: 14.w,
                        color: AppColors.textSecondary,
                      ),
                      SizedBox(height: 16.h),
                      TabBar(
                        labelColor: Color(0xFF2972FF),
                        unselectedLabelColor: Colors.grey,
                        indicatorColor: Colors.blue,
                        labelStyle: GoogleFonts.inter(
                          fontSize: 14.w,
                          fontWeight: FontWeight.w700,
                        ),
                        tabs: const [
                          Tab(text: "Pending"),
                          Tab(text: "In Progress"),
                          Tab(text: "Completed"),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      Expanded(
                        child: TabBarView(
                          children: [
                            ListView.builder(
                              itemCount: controller.bookingPendingList.length,
                              itemBuilder: (context, index) {
                                return statusContainer(
                                  controller.bookingPendingList[index],
                                  "Importer",
                                );
                              },
                            ),
                            ListView.builder(
                              itemCount: controller.bookingProgressList.length,
                              itemBuilder: (context, index) {
                                return statusContainer(
                                  controller.bookingProgressList[index],
                                  "Importer",
                                );
                              },
                            ),
                            ListView.builder(
                              itemCount: controller.bookingCompletedList.length,
                              itemBuilder: (context, index) {
                                return statusContainer(
                                  controller.bookingCompletedList[index],
                                  "Importer",
                                );
                              },
                            )
                          ],
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
  }
}
