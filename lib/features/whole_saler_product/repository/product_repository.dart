import 'package:deco_trade_hub/features/whole_saler_product/model/product_model.dart';
import 'package:deco_trade_hub/services/global/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductModel>>> getProductsByStore(String storeId);

  Future<Either<Failure, ProductModel>> createProduct(ProductModel product);

  Future<Either<Failure, ProductModel>> updateProduct(ProductModel product);

  Future<Either<Failure, bool>> deleteProduct(String productId);
}
