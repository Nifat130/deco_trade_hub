import 'package:equatable/equatable.dart';
import 'package:deco_trade_hub/features/product/model/product_model.dart';

class CartItem extends Equatable {
  final ProductModel product;
  final int quantity;

  const CartItem({
    required this.product,
    this.quantity = 1,
  });

  double get totalPrice => (product.isOnOffer == true && product.offerPrice != null)
      ? product.offerPrice! * quantity
      : (product.price ?? 0) * quantity;

  CartItem copyWith({
    ProductModel? product,
    int? quantity,
  }) {
    return CartItem(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  List<Object?> get props => [product, quantity];
}

class CartItemModel {
  final String productId;
  final String productName;
  final double unitPrice;
  final int quantity;
  final String storeId;

  CartItemModel({
    required this.productId,
    required this.productName,
    required this.unitPrice,
    required this.quantity,
    required this.storeId,
  });

  double get total => unitPrice * quantity;

  Map<String, dynamic> toJson() => {
    'product_id': productId,
    'quantity': quantity,
    'unit_price': unitPrice,
    'store_id': storeId,
  };
}
