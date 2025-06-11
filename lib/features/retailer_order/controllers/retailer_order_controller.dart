// presentation/controllers/retailer_order_controller.dart

import 'package:get/get.dart';

import '../../retailer_cart/model/cart_model.dart';
import '../repository/retailer_order_repository.dart';

class RetailerOrderController extends GetxController {
  final RetailerOrderRepository _orderRepo;

  RetailerOrderController(this._orderRepo);

  Future<void> placeOrder({
    required String retailerStoreId,
    required List<CartItem> cartItems,
  }) async {
    if (cartItems.isEmpty) {
      Get.snackbar("Error", "Your cart is empty.");
      return;
    }

    final firstStoreId = cartItems.first.product.storeId;
    final isSameStore = cartItems.every((item) => item.product.storeId == firstStoreId);

    if (!isSameStore) {
      Get.snackbar("Error", "You can only order from one wholesaler at a time.");
      return;
    }

    final orderItems = cartItems.map((item) {
      final price = item.product.isOnOffer! ? item.product.offerPrice! : item.product.price;
      return {
        'product_id': item.product.id,
        'quantity': item.quantity,
        'unit_price': price,
      };
    }).toList();

    final total = orderItems.fold<double>(0.0, (sum, item) {
      final quantity = item['quantity'] as int;
      final price = (item['unit_price'] as num).toDouble();
      return sum + (quantity * price);
    });


    try {
      final orderId = await _orderRepo.placeOrder(
        retailerStoreId: retailerStoreId,
        wholesalerStoreId: firstStoreId!,
        orderItems: orderItems,
        totalAmount: total,
      );

      Get.snackbar("Success", "Order placed successfully.");
      // Clear your cart here
    } catch (e) {
      Get.snackbar("Order Failed", e.toString());
    }
  }
}
