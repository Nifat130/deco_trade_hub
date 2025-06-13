import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/image_path.dart';
import '../../../../routes/app_routes.dart';
import '../../controllers/home_screen_controller.dart';
import '../widgets/listview_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final HomeScreenController homeScreenController = Get.put(HomeScreenController());
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                                flex: 2,
                                child: ClipOval(
                                  child: Image.asset(ImagePath.profileImage, fit: BoxFit.fill, height: 44.h, width: 44.w,),
                                )
                            ),
                            Flexible(
                              flex: 6,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(text: "Nifat Chowdhury", color: AppColors.white, fontSize: 16.w,),
                                  Row(
                                    children: [
                                      CustomText(text: "Premium member", color: Colors.white70, fontSize: 14.w, fontWeight: FontWeight.w500,),
                                      SizedBox(width: 10.w,),
                                      // GestureDetector(
                                      //   onTap: (){
                                      //     Get.snackbar("me", "nifat");
                                      //   },
                                      //   child: CustomText(text: "(Upgrade)", color: AppColors.primary, fontSize: 14.w, decoration: TextDecoration.underline, fontWeight: FontWeight.w700,),
                                      // )
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
                                  onTap: (){
                                    Get.toNamed(AppRoute.notificationScreen);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: AppColors.borderColor),
                                      color: AppColors.white,
                                    ),
                                    child: Icon(Icons.notifications_none_outlined, color: AppColors.primary,),
                                  ),
                                )
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                          child: SizedBox(
                            width: double.infinity,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.borderColor,
                                ),
                                borderRadius: BorderRadius.circular(4),
                                color: AppColors.white
                              ),
                              child: Row(
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: IconButton(
                                      onPressed: (){
                                        Get.toNamed(AppRoute.loginScreen);
                                      },
                                      icon: Icon(Icons.search, color: AppColors.textSecondary,),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 7,
                                    child: TextFormField(
                                      controller: homeScreenController.name,
                                      onTap: (){
                                        Get.toNamed(AppRoute.loginScreen);
                                      },
                                      decoration: InputDecoration(
                                        hintText: "Search businesses and services",
                                        hintStyle: TextStyle(color: AppColors.textSecondary),
                                        border: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                      ),
                                      readOnly: true,
                                      style: GoogleFonts.poppins(
                                          fontSize: 16.w,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.textPrimary),
                                      ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.w, top: 20.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: "New Arrivals", fontSize: 16.w,),
                    SizedBox(height: 8.h,),
                    //pageViewer(homeScreenController.recommended),
                    listViewer(homeScreenController.newArrivals),
                    CustomText(text: "Top Rated Workers", fontSize: 16.w,),
                    SizedBox(height: 8.h,),
                    //pageViewer(homeScreenController.nearby),
                    listViewer(homeScreenController.workerList),
                    CustomText(text: "Trending Products", fontSize: 16.w,),
                    SizedBox(height: 8.h,),
                    //pageViewer(homeScreenController.trend)
                    listViewer(homeScreenController.newArrivals)
                  ],
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.white,
          onPressed: (){
            Get.toNamed(AppRoute.addProductScreen);
          },
          child: Icon(Icons.add_circle_outline_rounded, color: AppColors.primary, size: 28.h,),
        ),
      ),
    );
  }
}
