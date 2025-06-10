import 'package:deco_trade_hub/features/product/model/product_model.dart';
import 'package:deco_trade_hub/features/product/repository/product_repo_impl.dart';
import 'package:get/get.dart';

class RetailerProductController extends GetxController implements GetxService {
  final ProductRepository repo;

  RetailerProductController({required this.repo});

  // Common error
  String? _error;
  String? get error => _error;

  // Products
  List<ProductModel> _trendingProducts = [];
  List<ProductModel> get trendingProducts => _trendingProducts;

  List<ProductModel> _newArrivals = [];
  List<ProductModel> get newArrivals => _newArrivals;

  List<ProductModel> _offeredProducts = [];
  List<ProductModel> get offeredProducts => _offeredProducts;

  List<ProductModel> _allProducts = [];
  List<ProductModel> get allProducts => _allProducts;

  // Section Loaders
  bool _isLoadingTrending = false;
  bool get isLoadingTrending => _isLoadingTrending;

  bool _isLoadingNewArrivals = false;
  bool get isLoadingNewArrivals => _isLoadingNewArrivals;

  bool _isLoadingOffers = false;
  bool get isLoadingOffers => _isLoadingOffers;

  bool _isLoadingAllProducts = false;
  bool get isLoadingAllProducts => _isLoadingAllProducts;

  /// Load all homepage sections
  Future<void> loadRetailerProducts() async {
    fetchTrendingProducts();
    fetchNewArrivalProducts();
    fetchOfferedProducts();
  }

  Future<void> fetchTrendingProducts() async {
    _isLoadingTrending = true;
    update();
    final result = await repo.getAllTrendingProducts();
    result.fold(
          (failure) {
        _error = failure.message;
        _trendingProducts = [];
        Get.snackbar("Error", failure.message);
      },
          (data) {
        _trendingProducts = data;
      },
    );
    _isLoadingTrending = false;
    update();
  }

  Future<void> fetchNewArrivalProducts() async {
    _isLoadingNewArrivals = true;
    update();
    final result = await repo.getAllNewArrivalProducts();
    result.fold(
          (failure) {
        _error = failure.message;
        _newArrivals = [];
        Get.snackbar("Error", failure.message);
      },
          (data) {
        _newArrivals = data;
      },
    );
    _isLoadingNewArrivals = false;
    update();
  }

  Future<void> fetchOfferedProducts() async {
    _isLoadingOffers = true;
    update();
    final result = await repo.getAllOfferedProducts();
    result.fold(
          (failure) {
        _error = failure.message;
        _offeredProducts = [];
        Get.snackbar("Error", failure.message);
      },
          (data) {
        _offeredProducts = data;
      },
    );
    _isLoadingOffers = false;
    update();
  }

  /// Common filter logic
  Future<void> filterProducts({
    bool? isTrending,
    bool? isNewArrival,
    bool? isOnOffer,
    String? category,
    String? fabric,
  }) async {
    _isLoadingAllProducts = true;
    update();
    final result = await repo.filterAllProducts(
      isTrending: isTrending,
      isNewArrival: isNewArrival,
      isOnOffer: isOnOffer,
      category: category,
      fabric: fabric,
    );
    result.fold(
          (failure) {
        _error = failure.message;
        _allProducts = [];
        Get.snackbar("Error", failure.message);
      },
          (data) {
        _allProducts = data;
      },
    );
    _isLoadingAllProducts = false;
    update();
  }

  Future<void> fetchProductsByCategory(String category) async {
    _isLoadingAllProducts = true;
    update();
    final result = await repo.getProductsByCategoryForRetailer(category);
    result.fold(
          (failure) {
        _error = failure.message;
        _allProducts = [];
        Get.snackbar("Error", failure.message);
      },
          (data) {
        _allProducts = data;
      },
    );
    _isLoadingAllProducts = false;
    update();
  }

  Future<void> fetchProductsByFabric(String fabric) async {
    _isLoadingAllProducts = true;
    update();
    final result = await repo.getProductsByFabricForRetailer(fabric);
    result.fold(
          (failure) {
        _error = failure.message;
        _allProducts = [];
        Get.snackbar("Error", failure.message);
      },
          (data) {
        _allProducts = data;
      },
    );
    _isLoadingAllProducts = false;
    update();
  }
}
