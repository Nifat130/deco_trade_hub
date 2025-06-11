part of 'file_container.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    /// Singletons
    __initSingletons();

    /// Repositories
    __initRepos();

    /// Controllers
    __initControllers();
  }

  void __initSingletons() {
    Get.put(StoreSessionService());
  }

  void __initRepos() {
    Get.lazyPut<StoreRepository>(() => StoreRepository(), fenix: true);
    Get.lazyPut<ProductRepository>(() => ProductRepository(), fenix: true);
    Get.lazyPut<CartRepository>(() => CartRepository(), fenix: true);
    Get.lazyPut<RetailerOrderRepository>(() => RetailerOrderRepository(), fenix: true);
  }

  void __initControllers() {
    Get.lazyPut(() => StoreController(repo: Get.find()));
    Get.lazyPut(() => WholesalerProductController(repo: Get.find()));
    Get.lazyPut(() => RetailerProductController(repo: Get.find()));
    Get.lazyPut(() => RetailerCartController(Get.find()));
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => RetailerOrderController(Get.find()));
    Get.lazyPut(() => PaymentController());
  }
}
