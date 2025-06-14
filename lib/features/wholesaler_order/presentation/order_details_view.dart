// import 'package:deco_trade_hub/features/wholesaler_order/controllers/wholesaler_order_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
//
// import '../../product/model/product_model.dart';
// import '../../retailer_order/model/order_models.dart';
//
// class WholesalerOrderDetailsView extends StatefulWidget {
//   final String orderId;
//
//   const WholesalerOrderDetailsView({super.key, required this.orderId});
//
//   @override
//   State<WholesalerOrderDetailsView> createState() => _WholesalerOrderDetailsViewState();
// }
//
// class _WholesalerOrderDetailsViewState extends State<WholesalerOrderDetailsView> {
//   final controller = Get.find<WholesalerOrderController>();
//
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       controller.loadOrderDetails(orderId: widget.orderId);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Order Details"),
//         backgroundColor: Colors.blueAccent,
//         centerTitle: true,
//       ),
//       body: GetBuilder<WholesalerOrderController>(
//         builder: (retailerOrderController) {
//           if (retailerOrderController.isOrderDetailsLoading) {
//             return const Center(child: CircularProgressIndicator());
//           }
//
//           final OrderDetailsModel? order = retailerOrderController.selectedOrder;
//
//           if (order == null) {
//             return const Center(child: Text("Order not found."));
//           }
//
//           final StoreModel store = order.store;
//           final List<OrderItemModel> items = order.orderItems;
//
//           return SingleChildScrollView(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 _buildOrderInfoCard(order),
//                 const SizedBox(height: 16),
//                 _buildStoreInfoCard(store),
//                 const SizedBox(height: 16),
//                 const Text("Ordered Items", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 12),
//                 ListView.separated(
//                   physics: const NeverScrollableScrollPhysics(),
//                   shrinkWrap: true,
//                   itemCount: items.length,
//                   separatorBuilder: (_, __) => const SizedBox(height: 12),
//                   itemBuilder: (context, index) {
//                     final item = items[index];
//                     final ProductModel product = item.product;
//
//                     return Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(16),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withValues(alpha: .05),
//                             blurRadius: 6,
//                             offset: const Offset(0, 3),
//                           ),
//                         ],
//                         border: Border.all(color: Colors.blueAccent.withValues(alpha: .2)),
//                       ),
//                       child: ListTile(
//                         contentPadding: const EdgeInsets.all(12),
//                         leading: ClipRRect(
//                           borderRadius: BorderRadius.circular(8),
//                           child: product.avatarImage != null
//                               ? Image.network(product.avatarImage!, width: 50, height: 50, fit: BoxFit.cover)
//                               : Container(
//                                   width: 50,
//                                   height: 50,
//                                   color: Colors.grey[200],
//                                   child: const Icon(Icons.image, color: Colors.grey),
//                                 ),
//                         ),
//                         title: Text(product.name ?? "Unknown Product"),
//                         subtitle: Text("Qty: ${item.quantity}"),
//                         trailing: Text(
//                           "\$${item.totalPrice.toStringAsFixed(2)}",
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Colors.blueAccent,
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _buildOrderInfoCard(OrderDetailsModel order) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withValues(alpha: .05),
//             blurRadius: 6,
//             offset: const Offset(0, 3),
//           ),
//         ],
//         border: Border.all(color: Colors.blueAccent.withValues(alpha: .2)),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text("Order #: ${order.orderNumber}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
//           const SizedBox(height: 8),
//           Row(
//             children: [
//               const Text("Status: ", style: TextStyle(fontSize: 14)),
//               _buildStatusBadge(order.orderStatus),
//             ],
//           ),
//           const SizedBox(height: 8),
//           Text("Total: \$${order.totalAmount.toStringAsFixed(2)}", style: const TextStyle(fontSize: 14)),
//           const SizedBox(height: 8),
//           Text("Address: ${order.deliveryAddress}", style: const TextStyle(fontSize: 14)),
//           const SizedBox(height: 8),
//           Text("Placed on: ${DateFormat('dd MMM yyyy').format(order.createdAt)}",
//               style: const TextStyle(fontSize: 12, color: Colors.grey)),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildStoreInfoCard(StoreModel store) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withValues(alpha: .05),
//             blurRadius: 6,
//             offset: const Offset(0, 3),
//           ),
//         ],
//         border: Border.all(color: Colors.blueAccent.withValues(alpha: .2)),
//       ),
//       child: Row(
//         children: [
//           store.storeLogoUrl != null
//               ? CircleAvatar(radius: 30, backgroundImage: NetworkImage(store.storeLogoUrl!))
//               : const CircleAvatar(radius: 30, child: Icon(Icons.store)),
//           const SizedBox(width: 16),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(store.storeName, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//                 Text(store.addressLine1 ?? "No address", style: const TextStyle(fontSize: 14, color: Colors.grey)),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildStatusBadge(String status) {
//     Color color;
//     switch (status.toLowerCase()) {
//       case 'pending':
//         color = Colors.orangeAccent;
//         break;
//       case 'completed':
//         color = Colors.green;
//         break;
//       case 'cancelled':
//         color = Colors.redAccent;
//         break;
//       default:
//         color = Colors.grey;
//     }
//
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//       decoration: BoxDecoration(
//         color: color.withValues(alpha: .2),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Text(
//         status,
//         style: TextStyle(color: color, fontWeight: FontWeight.w600, fontSize: 12),
//       ),
//     );
//   }
// }

import 'package:deco_trade_hub/features/wholesaler_order/controllers/wholesaler_order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../order_helper/order_enum.dart';
import '../../product/model/product_model.dart';
import '../../retailer_order/model/order_models.dart';

class WholesalerOrderDetailsView extends StatefulWidget {
  final String orderId;
  final bool isWholesaler;

  const WholesalerOrderDetailsView({
    super.key,
    required this.orderId,
    required this.isWholesaler,
  });

  @override
  State<WholesalerOrderDetailsView> createState() => _WholesalerOrderDetailsViewState();
}

class _WholesalerOrderDetailsViewState extends State<WholesalerOrderDetailsView> {
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
      appBar: AppBar(
        title: const Text("Order Details"),
        backgroundColor: Colors.blueAccent,
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

          // Convert string status to enum for easier logic
          final OrderStatus currentStatus = OrderStatusExtension.fromString(order.orderStatus);

          return SingleChildScrollView(
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
                            color: Colors.black.withOpacity(.05),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        border: Border.all(color: Colors.blueAccent.withOpacity(.2)),
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
      child: ElevatedButton(
        onPressed: () async {
          if (nextStatus != null) {
            await controller.updateOrderStatus(orderId: orderId, newStatus: nextStatus);

            // Reload order details to refresh UI after status update
            await controller.loadOrderDetails(orderId: orderId);
          }
        },
        child: Text(buttonText),
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
            color: Colors.black.withOpacity(.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
        border: Border.all(color: Colors.blueAccent.withOpacity(.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Order #: ${order.orderNumber}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Row(
            children: [
              const Text("Status: ", style: TextStyle(fontSize: 14)),
              _buildStatusBadge(order.orderStatus),
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
            color: Colors.black.withOpacity(.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
        border: Border.all(color: Colors.blueAccent.withOpacity(.2)),
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

  Widget _buildStatusBadge(String status) {
    Color color;
    switch (status.toLowerCase()) {
      case 'pending':
        color = Colors.orangeAccent;
        break;
      case 'processing':
        color = Colors.blueAccent;
        break;
      case 'delivered':
        color = Colors.deepPurple;
        break;
      case 'completed':
        color = Colors.green;
        break;
      case 'cancelled':
        color = Colors.redAccent;
        break;
      default:
        color = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        style: TextStyle(color: color, fontWeight: FontWeight.w600, fontSize: 12),
      ),
    );
  }
}

extension OrderStatusExtension on OrderStatus {
  static OrderStatus fromString(String value) {
    return OrderStatus.values.firstWhere(
      (e) => e.name == value.toLowerCase(),
      orElse: () => OrderStatus.pending,
    );
  }
}
