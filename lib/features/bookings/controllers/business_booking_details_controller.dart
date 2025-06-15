
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/constants/app_colors.dart';

class BusinessBookingDetailsController extends GetxController{

  Rx<BookingStatus> status = BookingStatus.pending.obs;
  Rx<String> statusMessage = "Pending".obs;
  Color color = Colors.orange;
  RxBool review = false.obs;
  RxBool complete = false.obs;
  RxBool waiting = false.obs;
  RxBool hasReview = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    statusMessage.value = Get.arguments;
    if(statusMessage.value != "Pending"){
      if(statusMessage.value == "Progress"){
        status.value = BookingStatus.progress;
        statusMessage.value = "In Progress";
        color = AppColors.primary;
      }
      else{
        status.value = BookingStatus.completed;
        statusMessage.value = "Completed";
        color = Color(0xFF00DC1A);
      }
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  final TextEditingController supportTEController = TextEditingController();

  void statusProgress(){
    status.value = BookingStatus.progress;
    statusMessage.value = "In Progress";
    color = AppColors.primary;
  }
  void statusCompleted(){
    status.value = BookingStatus.completed;
    statusMessage.value = "Completed";
    color = Color(0xFF00DC1A);
  }
}

enum BookingStatus{pending, progress, completed}