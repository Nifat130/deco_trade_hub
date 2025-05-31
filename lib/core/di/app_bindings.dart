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
    final supabaseClient = Supabase.instance.client;

    /// Supabase Client
    Get.put(() => supabaseClient);
  }

  void __initRepos() {
    /// Store Repository
    Get.lazyPut<StoreRepository>(() => StoreRepositoryImpl(Get.find()));

    /// Product Repository
    Get.lazyPut<ProductRepository>(() => ProductRepositoryImpl());
  }

  void __initControllers() {
    Get.lazyPut(() => StoreController(repo: Get.find()));
    Get.lazyPut(() => CategoryController());
    Get.lazyPut(() => WholesalerProductController(repo: Get.find()));
    Get.lazyPut(() => AuthController());
  }
}
