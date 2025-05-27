import 'package:deco_trade_hub/features/whole_saler_product/model/product_model.dart';
import 'package:get/get.dart';

import '../repository/product_repository.dart' show ProductRepository;

class WholesalerProductController extends GetxController implements GetxService {
  final ProductRepository repo;

  WholesalerProductController({required this.repo});

  ProductModel? _product;

  ProductModel? get product => _product;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<ProductModel>? _allProducts;

  List<ProductModel>? get allProducts => _allProducts;

  String? _error;

  String? get error => _error;

  Future<void> fetchProducts(ProductModel product) async {}

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
          Get.snackbar("Success", "Product added successfully");
        },
      );
    } finally {
      _isLoading = false;
      update();
    }
  }
}
