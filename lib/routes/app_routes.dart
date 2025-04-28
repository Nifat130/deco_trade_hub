

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:deco_trade_hub/features/authentication/presentation/screens/common_screen.dart';
import 'package:deco_trade_hub/features/on_boarding/presentation/screens/onboarding_screens.dart';
import '../features/nav_bar/screen/nav_screen.dart';


class AppRoute {
  static String init = "/";
  static String loginScreen = "/loginScreen";
  static String signUpScreen = "/signUpScreen";
  static String onBoardingScreen = "/onBoardingScreen";
  static String commonScreen = "/commonScreen";
  static String bottomNevScreen = "/bottomNevScreen";




  static List<GetPage> routes = [
    GetPage(
      name: init,
      page: () => CommonScreen(),
      // transition: Transition.rightToLeft,
      // transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: onBoardingScreen,
      page: () =>  OnboardingScreens(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: commonScreen,
      page: () =>  CommonScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    // GetPage(name: init, page: () => const SplashScreen()),
    GetPage(name: bottomNevScreen, page:() => const BottomNevScreen()),
    // GetPage(name: roleSelectionScreen, page:() => const RoleSelectionScreen()),
    // GetPage(name: forgetPassword, page:() => const ForgetPassword()),
    // GetPage(name: otpVerificationScreen, page:() => const OtpVerificationScreen()),
    //
    // GetPage(name: changePasswordScreen, page:() => const ChangePasswordScreen()),
    // GetPage(name: bottomNevScreen, page:() => const BottomNevScreen()),
    //
    //
    // GetPage(name: home, page: ()=>const HomeScreen())

  ];
}