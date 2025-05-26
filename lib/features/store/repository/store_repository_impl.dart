import 'package:deco_trade_hub/features/store/model/store_model.dart';
import 'package:deco_trade_hub/features/store/repository/store_repository.dart';
import 'package:deco_trade_hub/services/global/failures.dart';
import 'package:fpdart/src/either.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton(as: StoreRepository)
class StoreRepositoryImpl implements StoreRepository {
  final SupabaseClient supabaseClient;

  StoreRepositoryImpl(this.supabaseClient);
  @override
  @override
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
  }) async {
    try {
      final currentUser = supabaseClient.auth.currentUser;
      if (currentUser == null) {
        return Left(Failure("User is not authenticated."));
      }

      final response = await supabaseClient.rpc(
        'create_store',
        params: {
          'p_store_name': storeName,
          'p_owner_id': currentUser.id,
          'p_contact_number': contactNumber,
          'p_email': email,
          'p_postal_code': postalCode,
          'p_store_type': storeType,
          'p_store_description': storeDescription,
          'p_store_logo_url': storeLogoUrl,
          'p_address_line1': addressLine1,
          'p_address_line2': addressLine2,
          'p_social_media_links': socialMediaLinks,
          'p_website_url': websiteUrl,
          'p_store_banner_url': storeBannerUrl,
          'p_featured_product_id': null,
          'p_nid': ownerNID,
          'p_tin': ownerTIN,
        },
      );

      if (response.error != null) {
        return Left(Failure(response.error!.message));
      }

      // Supabase RPC return value (store_id uuid)
      final storeId = response.data as String?;
      if (storeId == null) {
        return Left(Failure('Failed to create store: No store ID returned.'));
      }

      return Right(storeId);
    } on PostgrestException catch (e) {
      return Left(Failure(e.message));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deleteStore({required String storeId}) {
    // TODO: implement deleteStore
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, StoreModel>> getStoreDetailsById({required String storeId}) {
    // TODO: implement getStoreDetailsById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, StoreModel>> updateStoreDetails(
      {required String storeId,
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
      required String storeBannerUrl}) {
    // TODO: implement updateStoreDetails
    throw UnimplementedError();
  }
}

//  @override
//   Future<Result<List<String>>> getRegionFilters() async {
//     try {
//       final currentUser = supabaseClient.auth.currentUser;
//       if (currentUser == null) throw Exception('User is not authenticated.');
//
//       final response = await supabaseClient.rest.rpc(
//         'get_user_business_regions',
//         params: {'p_user_id': currentUser.id},
//       );
//
//       final regions = (response as List<dynamic>)
//           .map((item) => item['business_region'] as String)
//           .toList();
//
//       return Result.ok(regions);
//     } on PostgrestException catch (e) {
//       _log.warning(e.message);
//       return Result.error(e);
//     } on Exception catch (e) {
//       _log.warning(e.toString());
//       return Result.error(e);
//     }
//   }
