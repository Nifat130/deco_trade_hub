import 'package:deco_trade_hub/features/whole_saler_product/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../repository/product_repo_impl.dart';

enum ProductCategory {
  curtain('Curtain'),
  foamCover('Foam Cover'),
  pillowCover('Pillow Cover');

  final String name;

  const ProductCategory(this.name);
}

class WholesalerProductController extends GetxController implements GetxService {
  final ProductRepository repo;

  WholesalerProductController({required this.repo});

  final productName = TextEditingController();
  var categoryName = TextEditingController().obs;
  var selectedCategoryName = "".obs;
  final fabricType = TextEditingController();
  final fixedWidth = TextEditingController();
  final quantity = TextEditingController();
  final price = TextEditingController();
  final pillowSizeHeight = TextEditingController();
  final pillowSizeWidth = TextEditingController();
  final description = TextEditingController();
  final isNewArrival = false.obs;
  final isOnOffer = false.obs;
  final offerPrice = TextEditingController();

  void clearDataAfterSuccess() {
    productName.clear();
    categoryName.value.clear();
    selectedCategoryName.value = "";
    fabricType.clear();
    fixedWidth.clear();
    quantity.clear();
    price.clear();
    pillowSizeHeight.clear();
    pillowSizeWidth.clear();
    description.clear();
    posterImagePath.value = '';
    imagePathList.clear();
    isNewArrival.value = false;
    isOnOffer.value = false;
    update();
  }

  var posterImagePath = ''.obs;
  var imagePathList = [].obs;

  void pickPosterImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      posterImagePath.value = image.path;
      imagePathList.insert(0, posterImagePath.value);
    }
  }

  void pickProductImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagePathList.add(image.path);
    }
  }

  ProductModel? _product;

  ProductModel? get product => _product;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<ProductModel>? _allProducts;

  List<ProductModel>? get allProducts => _allProducts;

  String? _error;

  String? get error => _error;

  Future<void> fetchProducts() async {
    try {
      _isLoading = true;
      update();
      final result = await repo.getProductsByStore();
      result.fold(
        (failure) {
          _error = failure.message;
          Get.snackbar("Error", "${failure.message}");
        },
        (product) {
          _allProducts = product;
        },
      );
    } finally {
      _isLoading = false;
      update();
    }
  }

  Future<void> addProduct({required ProductModel productToCreate}) async {
    try {
      _isLoading = true;
      update();
      final result = await repo.createProduct(productToCreate);
      result.fold(
        (failure) {
          _error = failure.message;
          Get.snackbar("Error", "Failed to add product: ${failure.message}");
        },
        (product) {
          _product = product;
          clearDataAfterSuccess();
          Get.snackbar("Success", "Product added successfully");
        },
      );
    } finally {
      _isLoading = false;
      update();
    }
  }
}
