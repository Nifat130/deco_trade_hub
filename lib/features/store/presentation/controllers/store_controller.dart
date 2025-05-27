import 'package:deco_trade_hub/features/store/model/store_model.dart';
import 'package:deco_trade_hub/features/store/model/store_owner_model.dart';
import 'package:deco_trade_hub/features/store/repository/store_repository.dart';
import 'package:get/get.dart';
import 'package:shared/shared.dart';

class StoreController extends GetxController implements GetxService {
  final StoreRepository repo;

  StoreController({required this.repo});

  // Store Info
  StoreModel? _store;

  StoreModel? get store => _store;

  bool _isLoadingStore = false;

  bool get isLoadingStore => _isLoadingStore;

  // Store Owner Info
  StoreOwnerModel? _storeOwner;

  StoreOwnerModel? get storeOwner => _storeOwner;

  bool _isLoadingOwner = false;

  bool get isLoadingOwner => _isLoadingOwner;

  /// Fetch Store Info and Owner Info (if available)
  Future<void> fetchStoreInfo() async {
    _isLoadingStore = true;
    update();

    final result = await repo.getUserStore();
    await result.fold(
      (failure) async {
        _store = null;
        logE('Error fetching store info: $failure');
      },
      (storeData) async {
        _store = storeData;
        if (storeData.ownerId != null) {
          await fetchStoreOwnerInfo(storeData.ownerId!);
        }
      },
    );

    _isLoadingStore = false;
    update();
  }

  /// Fetch Store Owner Info
  Future<void> fetchStoreOwnerInfo(String ownerId) async {
    _isLoadingOwner = true;
    update();

    final result = await repo.getStoreOwnerInfo(ownerId: ownerId);
    result.fold(
      (failure) {
        _storeOwner = null;
        logE('Error fetching store owner info: $failure');
      },
      (ownerData) {
        _storeOwner = ownerData;
      },
    );

    _isLoadingOwner = false;
    update();
  }

  Future<void> updateStoreDetails({
    required String storeId,
    String? storeName,
    String? contactNumber,
    String? email,
    String? description,
    String? addressLine1,
    String? addressLine2,
    Map<String, dynamic>? socialMediaLinks,
    String? websiteUrl,
  }) async {
    _isLoadingStore = true;
    update();

    final result = await repo.updateStoreDetails(
      storeId: storeId,
      storeName: storeName,
      contactNumber: contactNumber,
      description: description,
      email: email,
      addressLine1: addressLine1,
      addressLine2: addressLine2,
      socialMediaLinks: socialMediaLinks,
      websiteUrl: websiteUrl,
    );

    result.fold(
      (failure) {
        logE('Error updating store: $failure');
      },
      (updatedStore) {
        _store = updatedStore;
        Get.back(result: _store);
      },
    );
    print('Store updated: ${_store?.storeName}');

    _isLoadingStore = false;
    update();
  }
}
