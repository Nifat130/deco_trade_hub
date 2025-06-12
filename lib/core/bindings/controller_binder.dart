
import 'package:deco_trade_hub/features/Product/controllers/add_product_controller.dart';
import 'package:deco_trade_hub/features/feed/controllers/feed_controller.dart';
import 'package:deco_trade_hub/features/profile/controllers/edit_profile_controller.dart';
import 'package:deco_trade_hub/features/settings/controllers/business_setting_screen_controller.dart';
import 'package:get/get.dart';

import '../../features/authentication/controllers/common_controller.dart';
import '../../features/authentication/controllers/login_controller.dart';
import '../../features/authentication/controllers/sing_up_controller.dart';
import '../../features/on_boarding/controller/onboarding_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {

    //Get.put(SplashController(), permanent: true);
    Get.put(OnboardingController(), permanent: true);
    Get.put(CommonController(), permanent: true);
    Get.put(LoginController(), permanent: true);
    Get.put(SingUpController(), permanent: true);
    /*Get.lazyPut<SplashController>(
          () => SplashController(),
      fenix: true,
    );*/
    // Get.lazyPut<OtpVerifyController>(
    //       () => OtpVerifyController(),
    //   fenix: true,
    // );
    // Get.lazyPut<ForgetPassController>(
    //       () => ForgetPassController(),
    //   fenix: true,
    // );
    // Get.lazyPut<NavController>(
    //       () => NavController(),
    //   fenix: true,
    // );
    // Get.lazyPut<GrowthController>(
    //       () => GrowthController(),
    //   fenix: true,
    // );
    Get.lazyPut<BusinessSettingScreenController>(() => BusinessSettingScreenController(), fenix: true,);

    Get.lazyPut<AddProductController>(() => AddProductController(), fenix: true,);
    Get.lazyPut<FeedController>(() => FeedController(), fenix: true,);
    Get.lazyPut<EditProfileController>(() => EditProfileController(), fenix: true,);

  }
}