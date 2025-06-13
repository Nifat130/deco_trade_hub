import 'package:deco_trade_hub/core/utils/helpers/supabase_helper.dart';
import 'package:deco_trade_hub/features/Authentication/data/data_source/store_session.dart';
import 'package:deco_trade_hub/services/global/failures.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/product_model.dart';

class ProductRepository {
  final SupabaseClient supabaseClient = Supabase.instance.client;
  final storeId = Get.find<StoreSessionService>().storeId!;

  ProductRepository();

  /// Wholesaler's concern

  Future<Either<Failure, List<ProductModel>>> getProductsByStore() {
    return safeSupabaseCall(() async {
      final response =
          await supabaseClient.from('products').select().eq('store_id', storeId).order('created_at', ascending: false);
      return (response as List).map((e) => ProductModel.fromJson(e)).toList();
    });
  }

  Future<Either<Failure, ProductModel>> createProduct(ProductModel product) {
    return safeSupabaseCall(() async {
      final response = await supabaseClient.from('products').insert(product.toJsonForCreate()).select().single();

      return ProductModel.fromJson(response);
    });
  }

  Future<Either<Failure, ProductModel>> updateProduct(ProductModel product) {
    return safeSupabaseCall(() async {
      final updateData = product.toJsonForUpdate();

      // Add storeId to ensure ownership and consistency
      updateData['store_id'] = storeId;

      final response = await supabaseClient.from('products').upsert(updateData, onConflict: 'id').select().single();

      return ProductModel.fromJson(response);
    });
  }

  Future<Either<Failure, bool>> deleteProduct(String productId) {
    return safeSupabaseCall(() async {
      await supabaseClient.from('products').delete().eq('id', productId);
      return true;
    });
  }

  /// Retailer's concern

  Future<Either<Failure, List<ProductModel>>> getAllOfferedProducts() {
    return safeSupabaseCall(() async {
      final response =
          await supabaseClient.from('products').select().eq('is_on_offer', true).order('updated_at', ascending: false);

      return (response as List).map((e) => ProductModel.fromJson(e)).toList();
    });
  }

  Future<Either<Failure, List<ProductModel>>> getAllTrendingProducts() {
    return safeSupabaseCall(() async {
      final response =
          await supabaseClient.from('products').select().eq('is_trending', true).order('updated_at', ascending: false);

      return (response as List).map((e) => ProductModel.fromJson(e)).toList();
    });
  }

  Future<Either<Failure, List<ProductModel>>> getAllNewArrivalProducts() {
    // return safeSupabaseCall(() async {
    //   final response = await supabaseClient.from('products').select().eq('is_new_arrival', true).order('created_at', ascending: false);
    //
    //   return (response as List).map((e) => ProductModel.fromJson(e)).toList();
    // });
    return safeSupabaseCall(() async {
      final response = await supabaseClient.from('products').select().order('created_at', ascending: false).limit(10);

      return (response as List).map((e) => ProductModel.fromJson(e)).toList();
    });
  }

  Future<Either<Failure, List<ProductModel>>> getProductsByCategoryForRetailer(String category) {
    return safeSupabaseCall(() async {
      final response =
          await supabaseClient.from('products').select().eq('category', category).order('created_at', ascending: false);

      return (response as List).map((e) => ProductModel.fromJson(e)).toList();
    });
  }

  Future<Either<Failure, List<ProductModel>>> getProductsByFabricForRetailer(String fabric) {
    return safeSupabaseCall(() async {
      final response =
          await supabaseClient.from('products').select().eq('fabrics', fabric).order('created_at', ascending: false);

      return (response as List).map((e) => ProductModel.fromJson(e)).toList();
    });
  }

  Future<Either<Failure, List<ProductModel>>> filterAllProducts({
    bool? isTrending,
    bool? isNewArrival,
    bool? isOnOffer,
    String? category,
    String? fabric,
  }) {
    return safeSupabaseCall(() async {
      final filter = supabaseClient.from('products').select();

      if (isTrending != null) filter.eq('is_trending', isTrending);
      if (isNewArrival != null) filter.eq('is_new_arrival', isNewArrival);
      if (isOnOffer != null) filter.eq('is_on_offer', isOnOffer);
      if (category != null) filter.eq('category', category);
      if (fabric != null) filter.eq('fabrics', fabric);

      final response = await filter.order('created_at', ascending: false);

      return (response as List).map((e) => ProductModel.fromJson(e)).toList();
    });
  }
}
