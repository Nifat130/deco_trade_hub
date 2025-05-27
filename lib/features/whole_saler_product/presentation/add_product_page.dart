import 'package:deco_trade_hub/features/store/presentation/controllers/store_controller.dart';
import 'package:deco_trade_hub/features/whole_saler_product/controllers/category_controller.dart';
import 'package:deco_trade_hub/features/whole_saler_product/controllers/wholesaler_product_controller.dart';
import 'package:deco_trade_hub/features/whole_saler_product/model/product_model.dart';
import 'package:deco_trade_hub/features/whole_saler_product/presentation/widgets/category_selector_widget.dart';
import 'package:deco_trade_hub/ui/widgets/global/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({Key? key}) : super(key: key);

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final nameController = TextEditingController();
  final priceController = TextEditingController();

  final productController = Get.find<WholesalerProductController>();
  final categoryController = Get.find<CategoryController>();

  void onSubmit() {
    final name = nameController.text.trim();
    final price = double.tryParse(priceController.text.trim()) ?? 0;
    final storeId = Get.find<StoreController>().store?.id!;
    if (storeId == null) {
      Get.snackbar("Error", "Store ID is not available");
      return;
    }

    final selectedSubCat = categoryController.selectedSubCategory.value;
    if (selectedSubCat == null) {
      Get.snackbar("Error", "Please select a subcategory");
      return;
    }

    if (name.isEmpty) {
      Get.snackbar("Error", "Product name cannot be empty");
      return;
    }

    if (price <= 0) {
      Get.snackbar("Error", "Price must be greater than zero");
      return;
    }

    final product = ProductModel(
      id: '',
      name: name,
      description: null,
      price: price,
      imageUrl: null,
      categoryId: selectedSubCat.id,
      stockQuantity: 1,
      isTrending: false,
      isNewArrival: false,
      isOnOffer: false,
      offerPrice: null,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      storeId: storeId,
    );

    productController.addProduct(productToCreate: product);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Add Product', isBackButtonExist: false),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Product Name'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),

            CategorySelectorWidget(),

            const SizedBox(height: 12),

            // Submit Button & loading with GetBuilder
            GetBuilder<WholesalerProductController>(
              builder: (productCtrl) {
                if (productCtrl.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                return ElevatedButton(
                  onPressed: onSubmit,
                  child: const Text('Create Product'),
                );
              },
            ),

            // Error message display
            GetBuilder<WholesalerProductController>(
              builder: (productCtrl) {
                if (productCtrl.error == null) return const SizedBox.shrink();

                return Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    productCtrl.error!,
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
