import 'package:flutter/cupertino.dart';

import '../../../order_helper/order_enum.dart';

class OrderStatusBadge extends StatelessWidget {
  final OrderStatus status;
  final bool isWholesaler;

  const OrderStatusBadge({
    Key? key,
    required this.status,
    required this.isWholesaler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: status.color.withValues(alpha: .15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        isWholesaler ? status.labelForWholesaler : status.labelForRetailer,
        style: TextStyle(color: status.color, fontWeight: FontWeight.bold, fontSize: 12),
      ),
    );
  }
}
