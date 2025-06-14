import 'package:deco_trade_hub/features/wholesaler_order/controllers/wholesaler_order_controller.dart';
import 'package:deco_trade_hub/features/wholesaler_order/presentation/order_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../order_helper/order_enum.dart';

class WholesalerOrdersView extends StatefulWidget {
  const WholesalerOrdersView({super.key});

  @override
  State<WholesalerOrdersView> createState() => _WholesalerOrdersViewState();
}

class _WholesalerOrdersViewState extends State<WholesalerOrdersView> {
  final controller = Get.find<WholesalerOrderController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.loadOrders();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Orders"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: GetBuilder<WholesalerOrderController>(
        builder: (_) {
          if (_.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (_.orders.isEmpty) {
            return const Center(child: Text("No orders yet."));
          }

          return RefreshIndicator(
            color: Colors.blueAccent,
            onRefresh: () async {
              await controller.loadOrders();
            },
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: _.orders.length,
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemBuilder: (_, index) {
                final order = controller.orders[index];
                final orderStatus = OrderStatus.fromString(order.orderStatus);

                return GestureDetector(
                  onTap: () {
                    Get.to(() => WholesalerOrderDetailsView(
                          orderId: order.id,
                          isWholesaler: true,
                        ));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.blueAccent.withOpacity(0.2)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Order #${order.orderNumber}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            _buildStatusBadge(orderStatus),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Total Amount:", style: TextStyle(color: Colors.grey)),
                            Text(
                              "\$${order.totalAmount.toStringAsFixed(2)}",
                              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Placed on: ${DateFormat('dd MMM yyyy').format(order.createdAt)}",
                          style: const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildStatusBadge(OrderStatus status) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: status.color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status.label,
        style: TextStyle(color: status.color, fontWeight: FontWeight.w600, fontSize: 12),
      ),
    );
  }
}
