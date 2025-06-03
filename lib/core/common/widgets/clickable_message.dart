
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

SnackbarController clickableMessage(){
  return Get.snackbar("Message", "This is clickable!!", backgroundColor: CupertinoColors.systemGreen.withAlpha(150));
}