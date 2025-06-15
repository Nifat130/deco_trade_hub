import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class SingUpController extends GetxController{

  var email = TextEditingController();
  var name = TextEditingController();
  var password = TextEditingController();
  RxBool visibility = true.obs;
  var selectedRole = ''.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if(Get.arguments != null){
      selectedRole.value = Get.arguments;
      log(selectedRole.value);
    }
  }

  /// Business Information
  final businessNameTEController = TextEditingController();
  final locationTEController = TextEditingController();
  final establishedTEController = TextEditingController();
  final ownerNameTEController = TextEditingController();
  final ownerPhoneTEController = TextEditingController();
  final aboutTEController = TextEditingController();

  var logoPath = ''.obs;
  var businessLicencePath = ''.obs;
  var importLicencePath = ''.obs;
  var establishedDate = 'Enter your establish date'.obs;
  void pickLogo() async{
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);

    if(image != null){
      logoPath.value = image.path;
    }
  }

  void pickNidCard() async{
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);

    if(image != null){
      nidPath.value = image.path;
    }
  }
  void pickBusinessLicence() async{
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);

    if(image != null){
      businessLicencePath.value = image.path;
    }
  }
  void pickImportLicence() async{
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);

    if(image != null){
      importLicencePath.value = image.path;
    }
  }

  void pickDate(BuildContext context) async{
    final date = await showDatePicker(
        context: context,
        firstDate: DateTime(1970),
        lastDate: DateTime.now()
    );
    establishedDate.value = DateFormat('dd-MMM-yyy').format(date!);
  }

  /// Employee Information
  final employeeAgeTEController = TextEditingController();
  final employeeLocationTEController = TextEditingController();
  final preferPositionTEController = TextEditingController();
  final bioTEController = TextEditingController();
  final birthTEController = TextEditingController();

  var profilePicPath = ''.obs;
  var nidPath = ''.obs;
  var birthDate = 'Enter your birth date'.obs;
  void pickProfile() async{
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);

    if(image != null){
      profilePicPath.value = image.path;
    }
  }

  void pickNIDFront() async{
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);

    if(image != null){
      nidPath.value = image.path;
    }
  }

  void pickBirthDate(BuildContext context) async{
    final date = await showDatePicker(
        context: context,
        firstDate: DateTime(1970),
        lastDate: DateTime.now()
    );
    birthDate.value = DateFormat('dd-MMM-yyy').format(date!);
  }
}