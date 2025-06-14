import 'package:deco_trade_hub/features/order/controllers/wholesaler_order_controller.dart';
import 'package:deco_trade_hub/features/order/view/shared/order_status_badge.dart';
import 'package:deco_trade_hub/ui/nifat/widgets/custom_button.dart';
import 'package:deco_trade_hub/ui/widgets/global/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../order_helper/order_enum.dart';
import '../../../product/model/product_model.dart';
import '../../controllers/retailer_order_controller.dart';
import '../../model/order_models.dart';

class OrderDetailsView extends StatefulWidget {
  final String orderId;
  final bool isWholesaler;

  const OrderDetailsView({
    super.key,
    required this.orderId,
    required this.isWholesaler,
  });

  @override
  State<OrderDetailsView> createState() => _OrderDetailsViewState();
}

class _OrderDetailsViewState extends State<OrderDetailsView> {
  final controller = Get.find<WholesalerOrderController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.loadOrderDetails(orderId: widget.orderId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Order Details",
        centerTitle: true,
      ),
      body: GetBuilder<WholesalerOrderController>(
        builder: (retailerOrderController) {
          if (retailerOrderController.isOrderDetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final OrderDetailsModel? order = retailerOrderController.selectedOrder;

          if (order == null) {
            return const Center(child: Text("Order not found."));
          }

          final StoreModel store = order.store;
          final List<OrderItemModel> items = order.orderItems;

          final OrderStatus currentStatus = OrderStatus.fromString(order.orderStatus);

          return RefreshIndicator(
            onRefresh: () async {
              await controller.loadOrderDetails(orderId: widget.orderId);
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildOrderInfoCard(order),
                  const SizedBox(height: 16),
                  _buildStoreInfoCard(store),
                  const SizedBox(height: 16),
                  const Text("Ordered Items", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: items.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final item = items[index];
                      final ProductModel product = item.product;

                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: .05),
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                          border: Border.all(color: Colors.blueAccent.withValues(alpha: .2)),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(12),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: product.avatarImage != null
                                ? Image.network(product.avatarImage!, width: 50, height: 50, fit: BoxFit.cover)
                                : Container(
                                    width: 50,
                                    height: 50,
                                    color: Colors.grey[200],
                                    child: const Icon(Icons.image, color: Colors.grey),
                                  ),
                          ),
                          title: Text(product.name ?? "Unknown Product"),
                          subtitle: Text("Qty: ${item.quantity}"),
                          trailing: Text(
                            "\$${item.totalPrice.toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  // The dynamic status update button
                  _buildStatusUpdateButton(currentStatus, retailerOrderController, order.id),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildStatusUpdateButton(OrderStatus currentStatus, WholesalerOrderController controller, String orderId) {
    if (controller.isUpdating) {
      return const Center(child: CircularProgressIndicator());
    }

    String? buttonText;
    OrderStatus? nextStatus;

    if (widget.isWholesaler) {
      // Wholesaler view logic
      if (currentStatus == OrderStatus.pending) {
        buttonText = "Accept Order";
        nextStatus = OrderStatus.processing;
      } else if (currentStatus == OrderStatus.processing) {
        buttonText = "Mark as Delivered";
        nextStatus = OrderStatus.delivered;
      } else {
        // No action for delivered or completed by wholesaler
        buttonText = null;
      }
    } else {
      // Retailer view logic
      if (currentStatus == OrderStatus.delivered) {
        buttonText = "Mark as Received";
        nextStatus = OrderStatus.completed;
      } else {
        buttonText = null;
      }
    }

    if (buttonText == null) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      width: double.infinity,
      child: CustomButton(
        onPressed: () async {
          if (nextStatus != null) {
            await controller.updateOrderStatus(orderId: orderId, newStatus: nextStatus);

            await controller.loadOrderDetails(orderId: orderId);

            if (widget.isWholesaler) {
              Get.find<WholesalerOrderController>().loadOrders();
            } else {
              Get.find<RetailerOrderController>().loadOrders();
            }
          }
        },
        title: buttonText,
      ),
    );
  }

  Widget _buildOrderInfoCard(OrderDetailsModel order) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
        border: Border.all(color: Colors.blueAccent.withValues(alpha: .2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Order #: ${order.orderNumber}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Row(
            children: [
              const Text("Status: ", style: TextStyle(fontSize: 14)),
              OrderStatusBadge(status: OrderStatus.fromString(order.orderStatus), isWholesaler: widget.isWholesaler),
            ],
          ),
          const SizedBox(height: 8),
          Text("Total: \$${order.totalAmount.toStringAsFixed(2)}", style: const TextStyle(fontSize: 14)),
          const SizedBox(height: 8),
          Text("Address: ${order.deliveryAddress}", style: const TextStyle(fontSize: 14)),
          const SizedBox(height: 8),
          Text("Placed on: ${DateFormat('dd MMM yyyy').format(order.createdAt)}",
              style: const TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildStoreInfoCard(StoreModel store) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
        border: Border.all(color: Colors.blueAccent.withValues(alpha: .2)),
      ),
      child: Row(
        children: [
          store.storeLogoUrl != null
              ? CircleAvatar(radius: 30, backgroundImage: NetworkImage(store.storeLogoUrl!))
              : const CircleAvatar(radius: 30, child: Icon(Icons.store)),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(store.storeName, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text(store.addressLine1 ?? "No address", style: const TextStyle(fontSize: 14, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
