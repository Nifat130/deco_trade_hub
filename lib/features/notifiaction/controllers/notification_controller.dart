
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/utils/constants/icon_path.dart';

class NotificationController extends GetxController{

  List<Map<String, dynamic>> notificationList = [
    {
      "icon" : Image.asset(IconPath.notificationIcon, fit: BoxFit.fill,),
      "description": "You're now subscribed to Premium! Enjoy exclusive benefits and discounts.",
      "read": false,
      "nid": 2001
    },
    {
      "icon" : Image.asset(IconPath.notificationIcon, fit: BoxFit.fill,),
      "description": "Your subscription plan has been renewed for another month",
      "read": false,
      "nid": 2001
    },
    {
      "icon" : Image.asset(IconPath.notification1, fit: BoxFit.fill,),
      "description": "Your appointment with TechFix is scheduled for Feb 10, 2025, at 3:00 PM ",
      "read": true,
      "nid": 2001
    },
    {
      "icon" : Image.asset(IconPath.notification2, fit: BoxFit.fill,),
      "description": "Your device repair is complete. Rate your experience!",
      "read": true,
      "nid": 2001
    },
    {
      "icon" : Image.asset(IconPath.notification3, fit: BoxFit.fill,),
      "description": "PediMART replied to your review.",
      "read": true,
      "nid": 2001
    },
  ];
}