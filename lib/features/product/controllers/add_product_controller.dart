
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddProductController extends GetxController{

  final productName = TextEditingController();
  var categoryName = TextEditingController().obs;
  var selectedCategoryName = "".obs;
  final fabricType = TextEditingController();
  final fixedWidth = TextEditingController();
  final quantity = TextEditingController();
  final price = TextEditingController();
  final pillowSizeHeight = TextEditingController();
  final pillowSizeWidth = TextEditingController();

  var category = ["Curtain", "Foam Cover", "Pillow Cover"];

  var posterImagePath = ''.obs;
  var imagePathList = [].obs;

  void pickPosterImage() async{
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if(image != null){
      posterImagePath.value = image.path;
      imagePathList.insert(0, posterImagePath.value);
    }
  }

  void pickProductImage() async{
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if(image != null){
      imagePathList.add(image.path);
    }
  }


}