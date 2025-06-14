import 'package:deco_trade_hub/features/order/view/shared/order_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/shimmers/order_listview_shimmer.dart';
import '../../../../ui/widgets/global/custom_appbar.dart';
import '../../../order_helper/order_enum.dart';
import '../../controllers/retailer_order_controller.dart';
import '../shared/order_card.dart';

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
      appBar: CustomAppBar(
        title: "Order Details",
        centerTitle: true,
        actionWidget: IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: () => controller.loadOrders(),
        ),
      ),
      body: GetBuilder<RetailerOrderController>(
        builder: (controller) {
          if (controller.isLoading) {
            return OrderListViewSkeleton();
          }

          if (controller.orders.isEmpty) {
            return const Center(child: Text("No orders yet."));
          }

          return RefreshIndicator(
            onRefresh: () async {
              await controller.loadOrders();
            },
            child: ListView.separated(
              padding: const EdgeInsets.all(12),
              itemCount: controller.orders.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final order = controller.orders[index];
                return OrderCard(
                  isWholesaler: false,
                  createdAt: order.createdAt,
                  orderNumber: order.orderNumber,
                  orderStatus: OrderStatus.fromString(order.orderStatus),
                  totalAmount: order.totalAmount,
                  onTap: () => Get.to(() => OrderDetailsView(
                        orderId: order.id,
                        isWholesaler: false,
                      )),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
