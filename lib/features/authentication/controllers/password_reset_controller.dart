

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PasswordResetController extends GetxController{

  final newpass = TextEditingController().obs;
  final confirmpass = TextEditingController().obs;
  RxBool newpassvisibility = true.obs;
  RxBool confirmpassvisibility = true.obs;

  /// function to hide view password
  void toggleNewpassVisiblity(){
    newpassvisibility.value = !newpassvisibility.value;
  }
  void toggleConfirmpassVisiblity(){
    confirmpassvisibility.value = !confirmpassvisibility.value;
  }
}