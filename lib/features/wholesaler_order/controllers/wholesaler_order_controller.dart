import 'package:deco_trade_hub/features/retailer_order/model/order_models.dart';
import 'package:get/get.dart';

import '../../Authentication/data/data_source/store_session.dart';
import '../../order_helper/order_enum.dart';
import '../model/wholesaler_order_model.dart';
import '../repository/wholesaler_order_repository.dart';

class WholesalerOrderController extends GetxController implements GetxService {
  final WholesalerOrderRepository _orderRepo;

  WholesalerOrderController(this._orderRepo);

  List<WholesalerOrder> orders = [];
  bool isLoading = false;

  Future<void> loadOrders() async {
    isLoading = true;
    update();

    try {
      final retailerStoreId = Get.find<StoreSessionService>().storeId;
      final result = await _orderRepo.fetchWholesalerOrders(retailerStoreId ?? '');
      result.match(
        (failure) {
          Get.snackbar("Error", failure.message);
          orders = [];
        },
        (orderList) {
          orders = orderList;
        },
      );
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

  /// Order status
  bool isUpdating = false;
  Future<void> updateOrderStatus({
    required String orderId,
    required OrderStatus newStatus,
  }) async {
    isUpdating = true;
    update();

    try {
      final result = await _orderRepo.updateOrderStatus(orderId: orderId, newStatus: newStatus);

      result.match(
        (failure) {
          Get.snackbar("Error", failure.message);
        },
        (_) {
          Get.snackbar("Success", "Order updated to ${newStatus.name}");
        },
      );
    } catch (e) {
      Get.snackbar("Error", "Failed to update order.");
    } finally {
      isUpdating = false;
      update();
    }
  }
}
