import 'package:get/get.dart';

import '../../product/model/product_model.dart';
import '../model/cart_model.dart';
import '../repository/cart_repository.dart';

class RetailerCartController extends GetxController implements GetxService {

  final CartRepository _cartRepository;

  RetailerCartController(this._cartRepository);


  List<CartItem> get items => _cartRepository.items;

  double get subtotal => _cartRepository.subtotal;

  double get deliveryFee => _cartRepository.deliveryFee;

  double get vat => _cartRepository.vat;

  double get total => _cartRepository.total;

  void addToCart(ProductModel product) {
    _cartRepository.addToCart(product);
    update();
  }

  void removeFromCart(String productId) {
    _cartRepository.removeFromCart(productId);
    update();
  }

  void increaseQuantity(String productId) {
    _cartRepository.increaseQuantity(productId);
    update();
  }

  void decreaseQuantity(String productId) {
    _cartRepository.decreaseQuantity(productId);
    update();
  }

  void clearCart() {
    _cartRepository.clearCart();
    update();
  }

  bool isProductInCart(String productId) {
    return _cartRepository.items.any((item) => item.product.id == productId);
  }
}
