import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:deco_trade_hub/features/store/presentation/store_profile_page.dart';
import 'package:deco_trade_hub/features/whole_saler_product/presentation/add_product_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/icon_path.dart';
import '../view/wholesaler_home_page.dart';

class WholesalerRoute extends StatelessWidget {
  const WholesalerRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      navBarStyle: NavBarStyle.style1,
      navBarHeight: 65.h,
      context,
      screens: [
        WholesalerHomePage(),
        const Placeholder(),
        const AddProductPage(),
        const Placeholder(),
        StoreProfilePage(),
      ],
      // margin: EdgeInsets.only(
      //   left: 20.w,
      //   right: 20.w,
      //   bottom: 20.h,
      // ),
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(20),
        colorBehindNavBar: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      items: [
        PersistentBottomNavBarItem(
          contentPadding: 0,
          icon: Image.asset(
            IconPath.homeButtonIcon,
            height: 24.h,
            width: 24.w,
          ),
          title: 'Home',
          textStyle: textStyle,
          // activeColorPrimary: context.theme.primaryColor,
          // inactiveColorPrimary: Colors.black,
        ),
        PersistentBottomNavBarItem(
          icon: Image.asset(
            IconPath.shoppingButtonIcon,
            height: 26.h,
            width: 26.w,
          ),
          title: 'Orders',
          textStyle: textStyle,
        ),
        PersistentBottomNavBarItem(
          icon: Image.asset(
            IconPath.shoppingButtonIcon,
            height: 26.h,
            width: 26.w,
          ),
          title: 'Add Product',
          textStyle: textStyle,
        ),
        PersistentBottomNavBarItem(
          icon: Image.asset(
            IconPath.settings,
            height: 26.h,
            width: 26.w,
          ),
          title: 'Store',
          textStyle: textStyle,
        ),
        PersistentBottomNavBarItem(
          icon: Image.asset(
            IconPath.hire,
            height: 26.h,
            width: 26.w,
          ),
          title: 'Profile',
          textStyle: textStyle,
        ),
      ],
      controller: PersistentTabController(
          // initialIndex: 0,
          ),
    );
  }
}

final textStyle = GoogleFonts.poppins(fontSize: 12.sp, fontWeight: FontWeight.w500, color: AppColors.textGrey);
