import 'package:deco_trade_hub/core/utils/helpers/supabase_helper.dart';
import 'package:deco_trade_hub/features/whole_saler_product/model/product_model.dart';
import 'package:deco_trade_hub/features/whole_saler_product/repository/product_repository.dart';
import 'package:deco_trade_hub/services/global/failures.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProductRepositoryImpl implements ProductRepository {
  final SupabaseClient supabaseClient = Supabase.instance.client;

  ProductRepositoryImpl();

  @override
  Future<Either<Failure, List<ProductModel>>> getProductsByStore(String storeId) {
    return safeSupabaseCall(() async {
      final response =
          await supabaseClient.from('products').select().eq('store_id', storeId).order('created_at', ascending: false);

      return (response as List).map((e) => ProductModel.fromJson(e)).toList();
    });
  }

  @override
  Future<Either<Failure, ProductModel>> createProduct(ProductModel product) {
    return safeSupabaseCall(() async {
      final response = await supabaseClient.from('products').insert(product.toJsonForCreate()).select().single();

      return ProductModel.fromJson(response);
    });
  }

  @override
  Future<Either<Failure, ProductModel>> updateProduct(ProductModel product) {
    return safeSupabaseCall(() async {
      final response =
          await supabaseClient.from('products').update(product.toJson()).eq('id', product.id).select().single();

      return ProductModel.fromJson(response);
    });
  }

  @override
  Future<Either<Failure, bool>> deleteProduct(String productId) {
    return safeSupabaseCall(() async {
      await supabaseClient.from('products').delete().eq('id', productId);
      return true;
    });
  }
}
