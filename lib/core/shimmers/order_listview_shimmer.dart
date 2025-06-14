import 'package:flutter/cupertino.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../features/order/view/shared/order_card.dart';
import '../../features/order_helper/order_enum.dart';

class OrderListViewSkeleton extends StatelessWidget {
  const OrderListViewSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
        child: ListView.separated(
      padding: const EdgeInsets.all(12),
      itemCount: 10,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        return OrderCard(
          isWholesaler: false,
          createdAt: DateTime.now(),
          orderNumber: 'order.orderNumber',
          orderStatus: OrderStatus.pending,
          totalAmount: 6969,
        );
      },
    ));
  }
}
