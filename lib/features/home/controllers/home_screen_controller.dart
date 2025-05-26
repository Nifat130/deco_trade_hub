import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/utils/constants/image_path.dart';

class HomeScreenController extends GetxController{

  var name = TextEditingController();

  final List<Map<String, dynamic>> newArrivals = [
    {
      "image": Image.asset(ImagePath.cloth2, width: double.infinity, height: 190.h, fit: BoxFit.fill,),
      "name": "ClothName",
      "description": "Great fabrics made in china"
    },
    {
      "image": Image.asset(ImagePath.cloth1, width: double.infinity, height: 190.h, fit: BoxFit.fill),
      "name": "ClothName",
      "description": "Great fabrics made in china"
    },
    {
      "image": Image.asset(ImagePath.cloth2, width: double.infinity, height: 190.h, fit: BoxFit.fill),
      "name": "ClothName",
      "description": "Great fabrics made in china"
    },
    {
      "image": Image.asset(ImagePath.cloth1, width: double.infinity, height: 190.h, fit: BoxFit.fill),
      "name": "ClothName",
      "description": "Great fabrics made in china"
    },
    {
      "image": Image.asset(ImagePath.cloth1, width: double.infinity, height: 190.h, fit: BoxFit.fill),
      "name": "ClothName",
      "description": "Great fabrics made in china"
    },
    {
      "image": Image.asset(ImagePath.cloth2, width: double.infinity, height: 190.h, fit: BoxFit.fill),
      "name": "ClothName",
      "description": "Great fabrics made in china"
    },
  ];
  final List<Map<String, dynamic>> workerList = [
    {
      "image": Image.asset(ImagePath.profileImage, width: 160.w, height: 190.h,),
      "name": "Nifat",
      "description": "A great passioned worker"
    },
    {
      "image": Image.asset(ImagePath.profileImage, width: 160.w, height: 190.h,),
      "name": "Nifat",
      "description": "A great passioned worker"
    },
    {
      "image": Image.asset(ImagePath.profileImage, width: 160.w, height: 190.h,),
      "name": "Nifat",
      "description": "A great passioned worker"
    },
    {
      "image": Image.asset(ImagePath.profileImage, width: 160.w, height: 190.h,),
      "name": "Nifat",
      "description": "A great passioned worker"
    },
    {
      "image": Image.asset(ImagePath.profileImage, width: 160.w, height: 190.h,),
      "name": "Nifat",
      "description": "A great passioned worker"
    },
    {
      "image": Image.asset(ImagePath.profileImage, width: 160.w, height: 190.h,),
      "name": "Nifat",
      "description": "A great passioned worker"
    },

  ];

}