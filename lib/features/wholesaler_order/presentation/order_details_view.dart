import 'package:deco_trade_hub/features/wholesaler_order/controllers/wholesaler_order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../product/model/product_model.dart';
import '../../retailer_order/model/order_models.dart';

class WholesalerOrderDetailsView extends StatefulWidget {
  final String orderId;

  const WholesalerOrderDetailsView({super.key, required this.orderId});

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
      appBar: AppBar(title: const Text("Order Details")),
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

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Order #: ${order.orderNumber}", style: const TextStyle(fontSize: 18)),
                Text("Status: ${order.orderStatus}"),
                Text("Total: \$${order.totalAmount.toStringAsFixed(2)}"),
                Text("Address: ${order.deliveryAddress}"),
                const Divider(),
                // Store info section
                Row(
                  children: [
                    store.storeLogoUrl != null
                        ? CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(store.storeLogoUrl!),
                          )
                        : const CircleAvatar(
                            radius: 30,
                            child: Icon(Icons.store),
                          ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(store.storeName, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          Text(store.addressLine1 ?? "No address"),
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(),
                const Text("Items:", style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Expanded(
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      final ProductModel product = item.product;
                      return ListTile(
                        leading: product.avatarImage != null
                            ? Image.network(product.avatarImage!, width: 50, height: 50, fit: BoxFit.cover)
                            : const Icon(Icons.image),
                        title: Text(product.name ?? "Unknown Product"),
                        subtitle: Text("Qty: ${item.quantity}"),
                        trailing: Text("\$${item.totalPrice.toStringAsFixed(2)}"),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
