
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';

import '../../../../core/utils/constants/app_colors.dart';
import '../controller/nav_controller.dart';


class BottomNevScreen extends StatelessWidget {
  const BottomNevScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Ensure the controller is initialized correctly
    Get.put(NavController()); // Add this line to ensure the controller is initialized

    return Scaffold(
      body: GetX<NavController>(
        builder: (driverNavBarController) {
          return driverNavBarController.screens[driverNavBarController.currentIndex];
        },
      ),
      bottomNavigationBar: GetX<NavController>(
        builder: (navController) {
          return BottomNavigationBar(

            backgroundColor: Colors.white,
            currentIndex: navController.currentIndex,
            selectedItemColor:  AppColors.primary,
            unselectedItemColor: AppColors.textGrey,
            showUnselectedLabels: true,
            onTap: navController.changeIndex,
            items: List.generate(navController.labels.length, (index) {
              return BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Image.asset(
                  navController.iconPaths[index],
                  height: 20.h,
                  width: 20.w,
                  fit: BoxFit.fill,
                  color: navController.currentIndex == index
                      ? AppColors.textPrimary
                      : AppColors.textPrimary.withOpacity(0.5),
                ),
                label: navController.labels[index],
                tooltip: navController.labels[index],
              );
            }),
            selectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12.sp,
              color:AppColors.primary,
            ),
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
              color: AppColors.textGrey,
            ),
          );
        },
      ),
    );
  }
}
