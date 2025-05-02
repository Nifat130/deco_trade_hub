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

  void __initSingletons() {}

  void __initRepos() {
    /// Profile Repository
    Get.lazyPut<ProfileRepository>(() => ProfileRepoImpl());
  }

  void __initControllers() {
    /// Profile controllers for Retailers
    Get.lazyPut(() => RetailerProfileController(Get.find()));

    /// Profile controllers for Wholesalers
    Get.lazyPut(() => WholesalerProfileController(Get.find()));
  }
}
