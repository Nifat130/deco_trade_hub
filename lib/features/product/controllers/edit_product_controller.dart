
import 'package:deco_trade_hub/features/product/controllers/wholesaler_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/product_model.dart';
import '../repository/product_repo_impl.dart';

class EditProductController extends GetxController {
  final ProductModel product;
  final ProductRepository productRepository = Get.find<ProductRepository>();

  EditProductController(this.product);

  final productName = TextEditingController();
  final categoryName = Rx<TextEditingController>(TextEditingController());
  final selectedCategoryName = Rx<String>('');
  final fabricType = TextEditingController();
  final fixedWidth = TextEditingController();
  final pillowSizeHeight = TextEditingController();
  final pillowSizeWidth = TextEditingController();
  final quantity = TextEditingController();
  final price = TextEditingController();
  final offerPrice = TextEditingController();
  final description = TextEditingController();

  final isNewArrival = false.obs;
  final isOnOffer = false.obs;

  final posterImagePath = ''.obs;
  final imagePathList = <String>[].obs;

  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    // Initialize controllers with product data
    productName.text = product.name ?? '';
    selectedCategoryName.value = product.category ?? '';
    categoryName.value.text = product.category ?? '';
    fabricType.text = product.fabrics ?? '';
    fixedWidth.text = product.clothWidth?.toString() ?? '';
    quantity.text = product.stockQuantity?.toString() ?? '';
    price.text = product.price?.toString() ?? '';
    offerPrice.text = product.offerPrice?.toString() ?? '';
    description.text = product.description ?? '';
    isNewArrival.value = product.isNewArrival ?? false;
    isOnOffer.value = product.isOnOffer ?? false;

    posterImagePath.value = product.avatarImage ?? '';

    if (product.productImages != null) {
      imagePathList.assignAll(product.productImages!);
    }
  }

  void pickPosterImage() {

  }

  void pickProductImage() {
  }

  Future<void> updateProduct() async {
    isLoading.value = true;

    try {
      final updatedProduct = ProductModel(
        id: product.id,
        name: productName.text,
        category: selectedCategoryName.value,
        fabrics: fabricType.text,
        clothWidth: double.tryParse(fixedWidth.text),
        stockQuantity: int.tryParse(quantity.text),
        price: double.tryParse(price.text),
        offerPrice: isOnOffer.value ? double.tryParse(offerPrice.text) : null,
        description: description.text,
        isNewArrival: isNewArrival.value,
        isOnOffer: isOnOffer.value,
        avatarImage: posterImagePath.value,
        productImages: imagePathList.toList(),
        storeId: product.storeId,
      );

      await productRepository.updateProduct(updatedProduct);

      /// TODO: make scalable refresh method
      Get.find<WholesalerProductController>().fetchProducts();
      Get.back(result: updatedProduct);
    } catch (e) {
      Get.snackbar("Error", "Failed to update product: $e");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    productName.dispose();
    categoryName.value.dispose();
    fabricType.dispose();
    fixedWidth.dispose();
    pillowSizeHeight.dispose();
    pillowSizeWidth.dispose();
    quantity.dispose();
    price.dispose();
    offerPrice.dispose();
    description.dispose();
    super.onClose();
  }
}
