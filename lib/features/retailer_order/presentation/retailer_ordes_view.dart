import 'package:deco_trade_hub/features/wholesaler_order/presentation/order_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/retailer_order_controller.dart';

class RetailerOrdersView extends StatefulWidget {
  const RetailerOrdersView({super.key});

  @override
  State<RetailerOrdersView> createState() => _RetailerOrdersViewState();
}

class _RetailerOrdersViewState extends State<RetailerOrdersView> {
  final controller = Get.find<RetailerOrderController>();

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
      appBar: AppBar(title: const Text('Your Orders')),
      body: GetBuilder<RetailerOrderController>(
        builder: (controller) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.orders.isEmpty) {
            return const Center(child: Text("No orders yet."));
          }

          return ListView.separated(
            padding: const EdgeInsets.all(12),
            itemCount: controller.orders.length,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              final order = controller.orders[index];
              return OrderCard(
                orderNumber: order.orderNumber,
                orderStatus: order.orderStatus,
                totalAmount: order.totalAmount,
                onTap: () => Get.to(() => WholesalerOrderDetailsView(
                      orderId: order.id,
                      isWholesaler: false,
                    )),
              );
            },
          );
        },
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final String orderNumber;
  final String orderStatus;
  final double totalAmount;
  final VoidCallback onTap;

  const OrderCard({
    super.key,
    required this.orderNumber,
    required this.orderStatus,
    required this.totalAmount,
    required this.onTap,
  });

  Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return Colors.orange;
      case 'completed':
        return Colors.green;
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        title: Text('Order #$orderNumber', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        subtitle: Text('Status: $orderStatus', style: TextStyle(color: getStatusColor(orderStatus))),
        trailing: Text('\$${totalAmount.toStringAsFixed(2)}',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        onTap: onTap,
      ),
    );
  }
}
