
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController{

  final productName = TextEditingController();
  final fabricType = TextEditingController();
  final quantity = TextEditingController();
  final price = TextEditingController();

  var category = ["Curtain", "Foam Cover", "Pillow Cover"];

  var posterImagePath = ''.obs;
  var imagePathList = [].obs;


}