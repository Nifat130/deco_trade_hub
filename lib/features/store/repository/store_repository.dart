import 'package:deco_trade_hub/services/global/failures.dart';
import 'package:fpdart/fpdart.dart';

import '../model/store_model.dart';

abstract interface class StoreRepository {
  /// Create Store: on Success catch Store Id as response
  Future<Either<Failure, String>> createStore({
    required String storeName,
    required String ownerName,
    required String storeDescription,
    required String storeLogoUrl,
    required String storeBannerUrl,
    required String ownerNID,
    required String ownerTIN,
    required String contactNumber,
    required String email,
    required String addressLine1,
    required String addressLine2,
    required String postalCode,
    required String storeType,
    required Map<String, dynamic> socialMediaLinks,
    required String websiteUrl,
  });

  /// Get Store Details
  Future<Either<Failure, StoreModel>> getStoreDetailsById({
    required String storeId,
  });

  /// Update Store Details
  Future<Either<Failure, StoreModel>> updateStoreDetails({
    required String storeId,
    required String storeName,
    required String ownerName,
    required String contactNumber,
    required String email,
    required String addressLine1,
    required String addressLine2,
    required String postalCode,
    required String storeType,
    required Map<String, dynamic> socialMediaLinks,
    required String websiteUrl,
    required String storeBannerUrl,
  });

  /// Delete Store
  Future<Either<Failure, String>> deleteStore({
    required String storeId,
  });
}
