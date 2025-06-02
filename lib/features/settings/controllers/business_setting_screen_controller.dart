

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/utils/constants/icon_path.dart';
import '../../../routes/app_routes.dart';

class BusinessSettingScreenController extends GetxController{

  RxBool twoStateVerify = true.obs;
  List<Map<String, dynamic>> accountSettings = [
    {
      "icon" : Image.asset(IconPath.updateEmailIcon, fit: BoxFit.fill,),
      "description": "Update Email & Password",
      //"navigate": AppRoute.settingsUpdateEmailPassword
    },
    {
      "icon" : Image.asset(IconPath.twoStateVerificationIcon, fit: BoxFit.fill,),
      "description": "Two-State Verification",
      "navigate": "false",
    },
    {
      "icon" : Image.asset(IconPath.binIcon, fit: BoxFit.fill,),
      "description": "Log Out",
      "navigate": AppRoute.loginScreen,
    },
    {
      "icon" : Image.asset(IconPath.binIcon, fit: BoxFit.fill,),
      "description": "Delete Account",
      "navigate": " "
    },
  ];

  List<Map<String, dynamic>> businessPreferenceSettings = [
    {
      "icon" : Image.asset(IconPath.ohIcon, fit: BoxFit.fill,),
      "description": "Update Operating Hours",
      //"navigate": AppRoute.settingsBUpdateOperatingHoursScreen
    },
    {
      "icon" : Image.asset(IconPath.updateEmailIcon, fit: BoxFit.fill,),
      "description": "Manage Notifications",
      //"navigate": AppRoute.settingsManageNotification
    },
    {
      "icon" : Image.asset(IconPath.updatePaymentIcon, fit: BoxFit.fill,),
      "description": "Earning & Withdraw",
      //"navigate": AppRoute.settingsBWithdrawScreen
    },

  ];

  List<Map<String, dynamic>> privacySettings = [
    {
      "icon" : Image.asset(IconPath.manageVisibilityIcon, fit: BoxFit.fill,),
      "description": "Manage Visibility",
      //"navigate": AppRoute.settingsBusinessVisibilityScreen
    },
    {
      "icon" : Image.asset(IconPath.reviewIcon, fit: BoxFit.fill,),
      "description": "Review App Permissions",
      //"navigate": AppRoute.settingsAppPermissionScreen
    },

  ];

  var imagePath = ''.obs;

  void pickLogo() async{
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if(image != null){
      imagePath.value = image.path;
    }
  }
}
