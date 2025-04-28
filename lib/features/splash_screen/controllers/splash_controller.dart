/*
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


import '../../../../core/utils/constants/image_path.dart';

import '../../../core/utils/constants/logo_path.dart';
import '../../on_boarding/presentation/screens/onboarding_screens.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  @override
  void onInit() {
    super.onInit();

    navigateToHomeScreen();
    preloadImages();
  }

  void preloadImages() {
    precacheImage(const AssetImage(ImagePath.onb1), Get.context!);
    precacheImage(const AssetImage(ImagePath.onb2), Get.context!);
    precacheImage(const AssetImage(ImagePath.onb3), Get.context!);
    precacheImage(const AssetImage(LogoPath.logo), Get.context!);
  }

  void navigateToHomeScreen() {
    Future.delayed(const Duration(milliseconds: 1500), () {
      Get.offAll(
        () => OnboardingScreen(),
        transition: Transition.fade,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
*/
