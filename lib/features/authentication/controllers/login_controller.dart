import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';

class LoginController extends GetxController{

  var email = TextEditingController();
  var password = TextEditingController();
  RxBool visibility = true.obs;
  RxString selectedRole = "Importer".obs;

}