import 'package:app_ui/app_ui.dart';
import 'package:deco_trade_hub/features/store/presentation/store_profile_page.dart';
import 'package:deco_trade_hub/features/whole_saler_product/presentation/add_product_page.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../view/wholesaler_home_page.dart';

class WholesalerRoute extends StatelessWidget {
  const WholesalerRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: [
        WholesalerHomePage(),
        const Placeholder(),
        const AddProductPage(),
        const Placeholder(),
        StoreProfilePage(),
      ],
      items: [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.home),
          title: 'Home',
          activeColorPrimary: context.theme.primaryColor,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.history),
          title: 'Orders',
          activeColorPrimary: context.theme.primaryColor,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.add_business),
          title: 'Add Product',
          activeColorPrimary: context.theme.primaryColor,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.settings),
          title: 'Store',
          activeColorPrimary: context.theme.primaryColor,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.person),
          title: 'Profile',
          activeColorPrimary: context.theme.primaryColor,
          inactiveColorPrimary: Colors.grey,
        ),
      ],
      controller: PersistentTabController(
          // initialIndex: 0,
          ),
    );
  }
}
