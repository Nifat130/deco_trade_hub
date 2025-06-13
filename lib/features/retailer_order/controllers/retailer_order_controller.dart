import 'package:deco_trade_hub/features/payment/controller/payment_controller.dart';
import 'package:deco_trade_hub/features/retailer_cart/controllers/cart_controller.dart';
import 'package:deco_trade_hub/features/retailer_order/model/order_models.dart';
import 'package:get/get.dart';
import 'package:shared/shared.dart';

import '../../Authentication/data/data_source/store_session.dart';
import '../../retailer_cart/model/cart_model.dart';
import '../repository/retailer_order_repository.dart';

class RetailerOrderController extends GetxController implements GetxService {
  final RetailerOrderRepository _orderRepo;

  RetailerOrderController(this._orderRepo);

  Future<void> placeOrder({
    required String retailerStoreId,
    required List<CartItem> cartItems,
  }) async {
    logD('------123----- step 1');
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
    logD('------123----- step 2');

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
    logD('------123----- step 3');

    final result = await Get.find<PaymentController>().initiateStripePayment(amount: total);

    result.match(
      (failure) => Get.snackbar("Payment Failed", failure.message),
      (stripeModel) async {
        final paymentIntentId = stripeModel.paymentIntentId;
        try {
          final orderId = await _orderRepo.placeOrder(
            stripePaymentIntentId: paymentIntentId,
            address: 'Dummy Address For Now',
            retailerStoreId: retailerStoreId,
            wholesalerStoreId: firstStoreId!,
            orderItems: orderItems,
            totalAmount: total,
          );

          logD('------123----- step 5 order done');

          Get.snackbar("Success", "Order placed successfully.");

          Get.find<RetailerCartController>().clearCart();
          logD('------123----- step 4 payment done');
        } catch (e) {
          logE('Error placing order: $e');
          Get.snackbar("Order Failed", e.toString());
        }
      },
    );
  }

  List<Map<String, dynamic>> orders = [];
  bool isLoading = false;

  Future<void> loadOrders() async {
    isLoading = true;
    update();

    try {
      final retailerStoreId = Get.find<StoreSessionService>().storeId;
      orders = await _orderRepo.fetchRetailerOrders(retailerStoreId ?? '');
    } catch (e) {
      Get.snackbar("Error", "Failed to load orders.");
    } finally {
      isLoading = false;
      update();
    }
  }

  OrderDetailsModel? selectedOrder;
  bool isOrderDetailsLoading = false;

  Future<void> loadOrderDetails({required String orderId}) async {
    isOrderDetailsLoading = true;
    update();

    try {
      final result = await _orderRepo.getOrderDetails(orderId);

      result.match(
        (failure) {
          Get.snackbar("Error", failure.message);
          selectedOrder = null;
        },
        (orderDetails) {
          selectedOrder = orderDetails;
        },
      );
    } catch (e) {
      Get.snackbar("Error", "Failed to load order details.");
      selectedOrder = null;
    } finally {
      isOrderDetailsLoading = false;
      update();
    }
  }
}
