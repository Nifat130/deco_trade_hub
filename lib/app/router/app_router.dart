import 'package:deco_trade_hub/app/router/app_routes.dart';
import 'package:deco_trade_hub/app/screens/screens.dart';
import 'package:deco_trade_hub/features/Authentication/presentation/shared/widget/role_prompt_page.dart';
import 'package:deco_trade_hub/features/Authentication/presentation/signin/view/signin_view.dart';
import 'package:deco_trade_hub/features/Authentication/presentation/signup/view/signup_view.dart';
import 'package:deco_trade_hub/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:get/get.dart';

final List<GetPage> appRoutes = [
  GetPage(
    name: AppRoutes.splash,
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: AppRoutes.onboarding,
    page: () => const OnBoardingView(),
  ),
  // GetPage(
  //   name: AppRoutes.home,
  //   page: () => const HomeScreen(),
  // ),
  GetPage(
    name: AppRoutes.error,
    page: () => const ErrorScreen(),
  ),
  GetPage(
    name: AppRoutes.rolePrompt,
    page: () => const RolePromptPage(),
    children: [
      GetPage(
        name: AppRoutes.signUp.replaceFirst(AppRoutes.rolePrompt, ''),
        page: () => SignUpPage(userRole: Get.arguments.toString()),
      ),
      GetPage(
        name: AppRoutes.signIn.replaceFirst(AppRoutes.rolePrompt, ''),
        page: () => const SignInPage(),
      ),
    ],
  ),
];
