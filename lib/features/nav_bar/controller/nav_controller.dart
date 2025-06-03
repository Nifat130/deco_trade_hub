
import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:deco_trade_hub/features/settings/presentation/screens/business_setting_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/constants/app_colors.dart';
import '../../../core/utils/constants/icon_path.dart';
import '../../home/presentation/screens/home_screen.dart';

class NavController extends GetxController {
  final _selectedIndex = 0.obs;
  int get currentIndex => _selectedIndex.value;

  void changeIndex(int index) {
    _selectedIndex.value = index;
  }

  // final List<Widget> businessScreens = [
  //   BusinessHomeScreen(),
  //   BusinessBookingScreen(),
  //   MessageScreen(),
  //   BusinessSettingScreen()
  // ];
  final List<Widget> screens = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    BusinessSettingScreen(),
  ];

  final List<String> labels = const ['Home', 'Bookings', 'Hire', 'Settings'];

  final List<Image> activeIcons = [
    Image.asset(IconPath.homeButtonIcon, height: 26.h, width: 26.w, fit: BoxFit.cover, color: AppColors.primary,),
    Image.asset(IconPath.shoppingButtonIcon, height: 26.h, width: 26.w, fit: BoxFit.cover, color: AppColors.primary),
    Image.asset(IconPath.hire, height: 26.h, width: 26.w, fit: BoxFit.cover, color: AppColors.primary),
    Image.asset(IconPath.settings, height: 26.h, width: 26.w, fit: BoxFit.cover, color: AppColors.primary),
  ];

  final List<Image> inActiveIcons = [
    Image.asset(IconPath.homeButtonIcon, height: 26.h, width: 26.w, fit: BoxFit.cover, color: AppColors.textSecondary,),
    Image.asset(IconPath.shoppingButtonIcon, height: 26.h, width: 26.w, fit: BoxFit.cover, color: AppColors.textSecondary),
    Image.asset(IconPath.hire, height: 26.h, width: 26.w, fit: BoxFit.cover, color: AppColors.textSecondary),
    Image.asset(IconPath.settings, height: 26.h, width: 26.w, fit: BoxFit.cover, color: AppColors.textSecondary),
  ];
}
