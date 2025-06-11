import 'package:deco_trade_hub/features/product/model/product_model.dart';
import 'package:deco_trade_hub/features/retailer_cart/model/cart_model.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CartRepository {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addToCart(ProductModel product) {
    final existingIndex = _items.indexWhere((item) => item.product.id == product.id);
    if (existingIndex >= 0) {
      _items[existingIndex] = _items[existingIndex].copyWith(
        quantity: _items[existingIndex].quantity + 1,
      );
    } else {
      _items.add(CartItem(product: product));
    }
  }

  void removeFromCart(String productId) {
    _items.removeWhere((item) => item.product.id == productId);
  }

  void increaseQuantity(String productId) {
    final index = _items.indexWhere((item) => item.product.id == productId);
    if (index >= 0) {
      _items[index] = _items[index].copyWith(
        quantity: _items[index].quantity + 1,
      );
    }
  }

  void decreaseQuantity(String productId) {
    final index = _items.indexWhere((item) => item.product.id == productId);
    if (index >= 0) {
      if (_items[index].quantity > 1) {
        _items[index] = _items[index].copyWith(
          quantity: _items[index].quantity - 1,
        );
      } else {
        removeFromCart(productId);
      }
    }
  }

  double get subtotal => _items.fold(
    0,
        (sum, item) => sum + item.totalPrice,
  );

  double get deliveryFee => 50.0; // Fixed delivery fee for example
  double get vat => subtotal * 0.05; // 5% VAT for example

  double get total => subtotal + deliveryFee + vat;

  void clearCart() {
    _items.clear();
  }
}



