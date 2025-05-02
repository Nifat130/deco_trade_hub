import 'package:deco_trade_hub/features/profile/repository/profile_repository.dart';
import 'package:get/get.dart';

class RetailerProfileController extends GetxController implements GetxService {
  final ProfileRepository repo;

  RetailerProfileController(this.repo);

  String? name;

  String getName() {
    print('getting msi');
    return name = repo.getName();
  }
}
