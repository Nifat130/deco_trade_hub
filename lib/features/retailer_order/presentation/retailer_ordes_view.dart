// import 'package:flutter/material.dart';
//
// class RetailerOrdersView extends StatefulWidget {
//   const RetailerOrdersView({super.key});
//
//   @override
//   State<RetailerOrdersView> createState() => _RetailerOrdersViewState();
// }
//
// class _RetailerOrdersViewState extends State<RetailerOrdersView> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

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
              title: Text("Order #${order['order_number']}"),
              subtitle: Text("Status: ${order['order_status']}"),
              trailing: Text("\$${order['total_amount']}"),
              onTap: () {
                Get.to(() => OrderDetailsView(orderId: order['id']));
              },
            );
          },
        );
      },
    );
  }
}
