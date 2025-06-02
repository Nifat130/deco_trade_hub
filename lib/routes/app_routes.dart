

import 'package:deco_trade_hub/features/home/presentation/screens/home_screen.dart';
import 'package:deco_trade_hub/features/notifiaction/presentation/screens/notification_screen.dart';
import 'package:deco_trade_hub/features/settings/presentation/screens/business_setting_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:deco_trade_hub/features/authentication/presentation/screens/common_screen.dart';
import 'package:deco_trade_hub/features/on_boarding/presentation/screens/onboarding_screens.dart';
import '../features/authentication/presentation/screens/employee_signup_information_screen.dart';
import '../features/authentication/presentation/screens/forgot_password_sreen.dart';
import '../features/authentication/presentation/screens/password_reset_screen.dart';
import '../features/authentication/presentation/screens/signup_information_screen.dart';
import '../features/nav_bar/screen/nav_screen.dart';


class AppRoute {
  static String init = "/";
  static String loginScreen = "/loginScreen";
  static String signUpScreen = "/signUpScreen";
  static String forgetPasswordScreen = "/forgetPasswordScreen";
  static String passwordResetScreen = "/resetPasswordScreen";
  static String onBoardingScreen = "/onBoardingScreen";
  static String commonScreen = "/commonScreen";
  static String signupInformationScreen = "/signupInformationScreen";
  static String employeeSignupInformationScreen = "/employeeSignupInformationScreen";
  static String bottomNevScreen = "/bottomNevScreen";
  static String homeScreen = "/homeScreen";
  static String notificationScreen = "/notificationScreen";
  static String businessSettingsScreen = "/businessSettingsScreen";


  /// Checking for role


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
    GetPage(name: bottomNevScreen, page:() => BottomNevScreen()),
    GetPage(name: signupInformationScreen, page:() => const SignupInformationScreen()),
    GetPage(name: employeeSignupInformationScreen, page:() => const EmployeeSignupInformationScreen()),
    GetPage(name: forgetPasswordScreen, page:() => ForgotPasswordScreen()),
    GetPage(name: passwordResetScreen, page:() => PasswordResetScreen()),
    GetPage(name: homeScreen, page:() => HomeScreen()),
    GetPage(name: notificationScreen, page:() => NotificationScreen()),
    GetPage(name: businessSettingsScreen, page:() => BusinessSettingScreen()),
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