import 'package:deco_trade_hub/features/store/repository/store_repository.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class StoreController extends GetxController implements GetxService {
  StoreRepository repo;

  StoreController({required this.repo});
}
