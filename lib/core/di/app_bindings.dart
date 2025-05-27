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
    Get.lazyPut(() => supabaseClient);
  }

  void __initRepos() {
    /// Profile Repository
    Get.lazyPut<StoreRepository>(() => StoreRepositoryImpl(Get.find()));
  }

  void __initControllers() {
    Get.lazyPut(() => StoreController(repo: Get.find()));
  }
}
