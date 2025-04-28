import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';

class SingUpController extends GetxController{

  var email = TextEditingController();
  var name = TextEditingController();
  var password = TextEditingController();
  RxBool visibility = true.obs;


}