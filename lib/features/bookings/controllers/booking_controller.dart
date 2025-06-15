
import 'dart:ui';
import 'package:deco_trade_hub/core/utils/constants/image_path.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/utils/constants/logo_path.dart';

class BookingController extends GetxController{

  List<Map<String, dynamic>> bookingPendingList = [
    {
      "heading": "Laptop Screen Replacement",
      "image": Image.asset(ImagePath.profileImage, fit: BoxFit.fill),
      "name": "TechFix Solutions",
      "date": "-5 January, 2024",
      "status": "Pending"
    },
    {
      "heading": "Laptop Screen Replacement",
      "image": Image.asset(ImagePath.profileImage, fit: BoxFit.fill),
      "name": "TechFix Solutions",
      "date": "-5 January, 2024",
      "status": "Pending"
    },
    {
      "heading": "Laptop Screen Replacement",
      "image": Image.asset(ImagePath.profileImage, fit: BoxFit.fill),
      "name": "TechFix Solutions",
      "date": "-5 January, 2024",
      "status": "Pending"
    },
    {
      "heading": "Laptop Screen Replacement",
      "image": Image.asset(ImagePath.profileImage, fit: BoxFit.fill),
      "name": "TechFix Solutions",
      "date": "-5 January, 2024",
      "status": "Pending"
    }
  ];
  List<Map<String, dynamic>> bookingProgressList = [
    {
      "heading": "Laptop Screen Replacement",
      "image": Image.asset(ImagePath.profileImage, fit: BoxFit.fill),
      "name": "TechFix Solutions",
      "date": "-5 January, 2024",
      "status": "Progress"
    },
    {
      "heading": "Laptop Screen Replacement",
      "image": Image.asset(ImagePath.profileImage, fit: BoxFit.fill),
      "name": "TechFix Solutions",
      "date": "-5 January, 2024",
      "status": "Progress"
    },
    {
      "heading": "Laptop Screen Replacement",
      "image": Image.asset(ImagePath.profileImage, fit: BoxFit.fill),
      "name": "TechFix Solutions",
      "date": "-5 January, 2024",
      "status": "Progress"
    },
    {
      "heading": "Laptop Screen Replacement",
      "image": Image.asset(ImagePath.profileImage, fit: BoxFit.fill),
      "name": "TechFix Solutions",
      "date": "-5 January, 2024",
      "status": "Progress"
    }
  ];

  List<Map<String, dynamic>> bookingCompletedList = [
    {
      "heading": "Laptop Screen Replacement",
      "image": Image.asset(ImagePath.profileImage, fit: BoxFit.fill),
      "name": "TechFix Solutions",
      "date": "-5 January, 2024",
      "status": "Completed"
    },
    {
      "heading": "Laptop Screen Replacement",
      "image": Image.asset(ImagePath.profileImage, fit: BoxFit.fill),
      "name": "TechFix Solutions",
      "date": "-5 January, 2024",
      "status": "Completed"
    },
    {
      "heading": "Laptop Screen Replacement",
      "image": Image.asset(ImagePath.profileImage, fit: BoxFit.fill),
      "name": "TechFix Solutions",
      "date": "-5 January, 2024",
      "status": "Completed"
    },
    {
      "heading": "Laptop Screen Replacement",
      "image": Image.asset(ImagePath.profileImage, fit: BoxFit.fill),
      "name": "TechFix Solutions",
      "date": "-5 January, 2024",
      "status": "Completed"
    }
  ];
}