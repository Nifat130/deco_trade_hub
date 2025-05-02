import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../view/wholesaler_home_page.dart';

class WholesalerRoute extends StatelessWidget {
  const WholesalerRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: const [
        WholesalerHomePage(),
        Placeholder(),
      ],
      items: [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.home),
          title: 'Home',
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
      controller: PersistentTabController(),
    );
  }
}
