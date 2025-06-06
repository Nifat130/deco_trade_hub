import 'package:deco_trade_hub/core/utils/helpers/supabase_helper.dart';
import 'package:deco_trade_hub/features/Authentication/data/data_source/store_session.dart';
import 'package:deco_trade_hub/features/whole_saler_product/model/product_model.dart';
import 'package:deco_trade_hub/services/global/failures.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProductRepository {
  final SupabaseClient supabaseClient = Supabase.instance.client;
  final storeId = Get.find<StoreSessionService>().storeId!;

  ProductRepository();

  Future<Either<Failure, List<ProductModel>>> getProductsByStore() {
    return safeSupabaseCall(() async {
      final response = await supabaseClient.from('products').select().eq('store_id', storeId).order('created_at', ascending: false);
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

      final response = await supabaseClient
          .from('products')
          .upsert(updateData, onConflict: 'id')
          .select()
          .single();

      return ProductModel.fromJson(response);
    });
  }

  Future<Either<Failure, bool>> deleteProduct(String productId) {
    return safeSupabaseCall(() async {
      await supabaseClient.from('products').delete().eq('id', productId);
      return true;
    });
  }
}
