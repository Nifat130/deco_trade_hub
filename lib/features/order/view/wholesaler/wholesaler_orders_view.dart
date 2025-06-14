import 'package:deco_trade_hub/features/order/controllers/wholesaler_order_controller.dart';
import 'package:deco_trade_hub/features/order/view/shared/order_details_view.dart';
import 'package:deco_trade_hub/ui/widgets/global/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/shimmers/order_listview_shimmer.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../order_helper/order_enum.dart';
import '../shared/order_card.dart';

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
      appBar: CustomAppBar(
        title: "My Orders",
        centerTitle: true,
      ),
      body: GetBuilder<WholesalerOrderController>(
        builder: (_) {
          if (_.isLoading) {
            return OrderListViewSkeleton();
          }

          if (_.orders.isEmpty) {
            return const Center(child: Text("No orders yet."));
          }

          return RefreshIndicator(
            color: AppColors.primary,
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
                    Get.to(() => OrderDetailsView(
                          orderId: order.id,
                          isWholesaler: true,
                        ));
                  },
                  child: OrderCard(
                    isWholesaler: true,
                    orderNumber: order.orderNumber,
                    totalAmount: order.totalAmount,
                    createdAt: order.createdAt,
                    orderStatus: orderStatus,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
