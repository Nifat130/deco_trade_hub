/*
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:master_grief/core/utils/constants/app_sizer.dart';


import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/logo_path.dart';
import '../../controllers/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (controller) {
        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(color: AppColors.primary),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 96.w),
              child: Center(child: SvgPicture.asset(LogoPath.logo)),
            ),
          ),
        );
      },
    );
  }
}
*/
