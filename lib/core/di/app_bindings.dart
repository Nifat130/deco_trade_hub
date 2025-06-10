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
    /// Store Repository
    Get.lazyPut<StoreRepository>(() => StoreRepository(), fenix: true);

    /// Product Repository
    Get.lazyPut<ProductRepository>(() => ProductRepository(), fenix: true);
  }

  void __initControllers() {
    Get.lazyPut(() => StoreController(repo: Get.find()));
    Get.lazyPut(() => WholesalerProductController(repo: Get.find()));
    Get.lazyPut(() => RetailerProductController(repo: Get.find()));
    Get.lazyPut(() => AuthController());
  }
}
