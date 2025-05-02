import 'package:deco_trade_hub/features/profile/repository/profile_repository.dart';
import 'package:get/get.dart';

class WholesalerProfileController extends GetxController implements GetxService {
  final ProfileRepository repo;

  WholesalerProfileController(this.repo);
}
