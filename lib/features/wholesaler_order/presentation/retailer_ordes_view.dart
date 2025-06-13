import 'package:deco_trade_hub/features/wholesaler_order/controllers/wholesaler_order_controller.dart';
import 'package:deco_trade_hub/features/wholesaler_order/presentation/order_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    return GetBuilder<WholesalerOrderController>(
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
                Get.to(() => WholesalerOrderDetailsView(orderId: order.id));
              },
            );
          },
        );
      },
    );
  }
}
