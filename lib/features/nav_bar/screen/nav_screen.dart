
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/constants/app_colors.dart';
import '../controller/nav_controller.dart';


class BottomNevScreen extends StatelessWidget {
  BottomNevScreen({super.key});
  final NavController navController = Get.put(NavController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<NavController>(
        builder: (creatorNavController) => creatorNavController.screens[creatorNavController.currentIndex],
      ),
      bottomNavigationBar: GetX<NavController>(
        builder: (navController) {
          return BottomNavigationBar(
            backgroundColor: AppColors.white,
            currentIndex: navController.currentIndex,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: const Color(0xff263238),
            showUnselectedLabels: true,
            onTap: navController.changeIndex,
            items: List.generate(
              navController.activeIcons.length,
                  (index) {
                return BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: navController.currentIndex == index
                      ? navController.activeIcons[index]
                      : navController.inActiveIcons[index],
                  label: navController.labels[index],
                  tooltip: navController.labels[index],
                );
              },
            ),
            selectedLabelStyle: GoogleFonts.poppins(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.primary
            ),

            unselectedLabelStyle: GoogleFonts.poppins(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textSecondary
            ),
          );
        },
      ),
    );
  }
}
