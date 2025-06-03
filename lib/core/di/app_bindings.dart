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
    /// Supabase Client
  }

  void __initRepos() {
    /// Store Repository
    Get.lazyPut<StoreRepository>(() => StoreRepository());

    /// Product Repository
    Get.lazyPut<ProductRepository>(() => ProductRepository());
  }

  void __initControllers() {
    Get.lazyPut(() => StoreController(repo: Get.find()));
    Get.lazyPut(() => CategoryController());
    Get.lazyPut(() => WholesalerProductController(repo: Get.find()));
    Get.lazyPut(() => AuthController());
  }
}
