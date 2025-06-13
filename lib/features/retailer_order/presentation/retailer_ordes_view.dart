import 'package:deco_trade_hub/features/retailer_order/presentation/order_details_view.dart';
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
    return GetBuilder<RetailerOrderController>(
      builder: (_) {
        if (_.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (_.orders.isEmpty) {
          return const Center(child: Text("No orders yet."));
        }

        return ListView.builder(
          itemCount: _.orders.length,
          itemBuilder: (context, index) {
            final order = _.orders[index];
            return ListTile(
              title: Text("Order #${order.orderNumber}"),
              subtitle: Text("Status: ${order.orderStatus}"),
              trailing: Text("\$${order.totalAmount}"),
              onTap: () {
                Get.to(() => OrderDetailsView(orderId: order.id));
              },
            );
          },
        );
      },
    );
  }
}
