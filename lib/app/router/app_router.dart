import 'package:deco_trade_hub/app/router/app_routes.dart';
import 'package:deco_trade_hub/app/screens/screens.dart';
import 'package:deco_trade_hub/features/Authentication/presentation/shared/widget/role_prompt_page.dart';
import 'package:deco_trade_hub/features/Authentication/presentation/signin/view/signin_view.dart';
import 'package:deco_trade_hub/features/Authentication/presentation/signup/view/signup_view.dart';
import 'package:deco_trade_hub/features/home/presentation/retailer/navigation/retailer_bottom_navbar.dart';
import 'package:deco_trade_hub/features/home/presentation/wholesaler/navigation/wholesaler_bottom_navbar.dart';
import 'package:deco_trade_hub/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:deco_trade_hub/features/store/model/store_model.dart';
import 'package:deco_trade_hub/features/store/presentation/shared/pages/store_sign_up_page.dart';
import 'package:deco_trade_hub/features/store/presentation/store_edit_page.dart';
import 'package:get/get.dart';

final List<GetPage> appRoutes = [
  GetPage(
    name: AppRoutes.splash,
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: AppRoutes.editStore,
    page: () => EditStorePage(store: Get.arguments['store'] as StoreModel),
  ),
  GetPage(
    name: AppRoutes.onboarding,
    page: () => const OnBoardingView(),
  ),
  GetPage(
    name: AppRoutes.storeForm,
    page: () => StoreSignUpForm(storeType: Get.arguments['storeType'] as String),
  ),
  GetPage(
    name: AppRoutes.error,
    page: () => const ErrorScreen(),
  ),
  GetPage(
    name: AppRoutes.signUp,
    page: () => SignUpPage(),
  ),
  GetPage(
    name: AppRoutes.signIn,
    page: () => const SignInPage(),
  ),
  GetPage(
    name: AppRoutes.rolePrompt,
    page: () => const RolePromptPage(),
  ),
  ...homeRoutes,
];

final List<GetPage> homeRoutes = [
  GetPage(
    name: AppRoutes.wholesalerHome,
    page: () => const WholesalerRoute(),
  ),
  GetPage(
    name: AppRoutes.retailerHome,
    page: () => const RetailerRoute(),
  ),
];
