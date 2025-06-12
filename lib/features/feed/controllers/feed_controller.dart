
import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/constants/image_path.dart';

class FeedController extends GetxController{

  List<Map<String, dynamic>> uploadsList = [
    {
      "image": ImagePath.cloth1,
      "time": "2 hour ago",
      "description": "Amazing Soft Oil Polister"
    },{
      "image": ImagePath.cloth2,
      "time": "2 hour ago",
      "description": "Amazing Soft Oil Polister"
    },{
      "image": ImagePath.cloth1,
      "time": "2 hour ago",
      "description": "Amazing Soft Oil Polister"
    },{
      "image": ImagePath.cloth2,
      "time": "2 hour ago",
      "description": "Amazing Soft Oil Polister"
    },
  ];
}