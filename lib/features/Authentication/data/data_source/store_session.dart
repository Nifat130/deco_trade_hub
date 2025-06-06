import 'package:get/get.dart';
import 'package:shared/shared.dart';

class StoreSessionService extends GetxService {
  String? _storeId;

  void setStoreId(String id) {
    logD('saving Store ID: $id');
    _storeId = id;
  }

  String? get storeId => _storeId;

  void clear() {
    _storeId = null;
  }
}
