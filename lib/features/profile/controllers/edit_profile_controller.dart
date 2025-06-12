
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class EditProfileController extends GetxController{

  /// Business Information
  final businessNameTEController = TextEditingController();
  final locationTEController = TextEditingController();
  final establishedTEController = TextEditingController();
  final ownerNameTEController = TextEditingController();
  final ownerPhoneTEController = TextEditingController();
  final aboutTEController = TextEditingController();
  var licencePath = ''.obs;
  var establishedDate = '19-12-1995'.obs;
  void pickLicence() async{
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);

    if(image != null){
      licencePath.value = image.path;
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

  var changedImage = "".obs;

  void pickNewPicture() async{
    final picker = ImagePicker();

    final image = await picker.pickImage(source: ImageSource.gallery);

    if(image != null){
      changedImage.value = image.path;
    }
  }
}