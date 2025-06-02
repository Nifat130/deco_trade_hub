import 'package:deco_trade_hub/features/store/model/store_model.dart';
import 'package:deco_trade_hub/features/store/model/store_owner_model.dart';
import 'package:deco_trade_hub/features/store/repository/store_repository.dart';
import 'package:deco_trade_hub/services/global/failures.dart';
import 'package:fpdart/src/either.dart';
import 'package:shared/shared.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class StoreRepositoryImpl implements StoreRepository {
  final SupabaseClient supabaseClient = Supabase.instance.client;

  StoreRepositoryImpl();

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
      //
      // final storeData = {
      //   'store_name': storeName,
      //   'owner_id': currentUser.id,
      //   'contact_number': contactNumber,
      //   'email': email,
      //   'postal_code': postalCode,
      //   'store_type': storeType,
      //   'store_description': storeDescription,
      //   'store_logo_url': storeLogoUrl,
      //   'address_line1': addressLine1,
      //   'address_line2': addressLine2,
      //   'social_media_links': socialMediaLinks,
      //   'website_url': websiteUrl,
      //   'store_banner_url': storeBannerUrl,
      //   'featured_product_id': null,
      //   'nid': ownerNID,
      //   'tin': ownerTIN,
      //   // 'created_at': DateTime.now().toIso8601String(),
      // };

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

      // final response = await supabaseClient.from('stores').insert(storeData);

      if (response == null) {
        return Left(Failure('Error creating store'));
      }

      // Supabase RPC return value (store_id uuid)
      final storeId = response as String?;
      if (storeId == null) {
        return Left(Failure('Failed to create store - store ID is null'));
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
  Future<Either<Failure, StoreModel>> getUserStore() async {
    try {
      final currentUser = supabaseClient.auth.currentUser;
      if (currentUser == null) {
        return Left(Failure("User is not authenticated."));
      }
      final response = await supabaseClient.from('stores').select().eq('owner_id', currentUser.id).single();

      final store = StoreModel.fromJson(response);
      return Right(store);
    } on PostgrestException catch (e) {
      return Left(Failure(e.message));
    } catch (e) {
      logE('Exception getting stores: ${e.toString()}');
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, StoreModel>> updateStoreDetails({
    required String storeId,
    String? storeName,
    String? description,
    String? contactNumber,
    String? email,
    String? addressLine1,
    String? addressLine2,
    Map<String, dynamic>? socialMediaLinks,
    String? websiteUrl,
  }) async {
    try {
      final currentUser = supabaseClient.auth.currentUser;
      if (currentUser == null) {
        return Left(Failure("User is not authenticated."));
      }

      final updateData = <String, dynamic>{
        if (storeName != null) 'store_name': storeName,
        // if (ownerName != null) 'owner_name': ownerName,
        if (description != null) 'store_description': description,
        if (contactNumber != null) 'contact_number': contactNumber,
        if (email != null) 'email': email,
        if (addressLine1 != null) 'address_line1': addressLine1,
        if (addressLine2 != null) 'address_line2': addressLine2,
        // if (postalCode != null) 'postal_code': postalCode,
        // if (storeType != null) 'store_type': storeType,
        if (socialMediaLinks != null) 'social_media_links': socialMediaLinks,
        if (websiteUrl != null) 'website_url': websiteUrl,
        // if (storeBannerUrl != null) 'store_banner_url': storeBannerUrl,
      };

      final response = await supabaseClient.from('stores').update(updateData).eq('id', storeId).select().single();

      final updatedStore = StoreModel.fromJson(response);
      return Right(updatedStore);
    } on PostgrestException catch (e) {
      return Left(Failure(e.message));
    } catch (e) {
      logE('Error updating store: ${e.toString()}');
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, StoreOwnerModel>> getStoreOwnerInfo({required String ownerId}) async {
    try {
      final currentUser = supabaseClient.auth.currentUser;
      if (currentUser == null) {
        return Left(Failure("User is not authenticated."));
      }
      final response = await supabaseClient.from('profiles').select().eq('id', ownerId).single();

      final store = StoreOwnerModel.fromJson(response);
      return Right(store);
    } on PostgrestException catch (e) {
      return Left(Failure(e.message));
    } catch (e) {
      logE('Exception getting store owner: ${e.toString()}');
      return Left(Failure(e.toString()));
    }
  }
}
