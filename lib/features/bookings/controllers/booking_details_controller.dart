

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/utils/constants/app_colors.dart';

class BookingDetailsController extends GetxController{

  Rx<Status> status = Status.pending.obs;
  Rx<String> statusMessage = "Finalizing Booking".obs;
  Rx<String> receiverStatus = "".obs;
  Color color = Color(0xFFE89E00);
  RxBool contactSupport = false.obs;
  RxBool payment = false.obs;
  RxBool review = false.obs;
  RxBool hasReview = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    receiverStatus.value = Get.arguments;
    if(receiverStatus.value != "Pending"){
      log(statusMessage.value);
      if(receiverStatus.value == "Progress"){
        log(statusMessage.value);
        statusProgress();
      }
      else{
        statusCompleted();
      }
    }
  }

  final TextEditingController supportTEController = TextEditingController();

  void statusProgress() async{
    status.value = Status.progress;
    statusMessage.value = "In Progress";
    color = AppColors.primary;
    await Future.delayed(Duration(seconds: 5));
    statusConfirm();
  }
  void statusConfirm(){
    status.value = Status.confirm;
    statusMessage.value = "Confirm Service Completion";
    color = AppColors.primary;
  }
  void statusCompleted(){
    status.value = Status.completed;
    statusMessage.value = "Completed";
    color = Color(0xFF00DC1A);
  }
}

enum Status{pending, progress, confirm, completed}