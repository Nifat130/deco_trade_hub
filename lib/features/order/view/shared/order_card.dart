import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../order_helper/order_enum.dart';
import 'order_status_badge.dart';

class OrderCard extends StatelessWidget {
  final String orderNumber;
  final double totalAmount;
  final DateTime createdAt;
  final OrderStatus orderStatus;
  final VoidCallback? onTap;
  final bool isWholesaler;

  const OrderCard({
    Key? key,
    required this.orderNumber,
    required this.totalAmount,
    required this.createdAt,
    required this.orderStatus,
    this.onTap,
    required this.isWholesaler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.blueAccent.withValues(alpha: 0.2)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
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
                    "Order #$orderNumber",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                OrderStatusBadge(
                  status: orderStatus,
                  isWholesaler: isWholesaler,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Total Amount:", style: TextStyle(color: Colors.grey)),
                Text(
                  "\$${totalAmount.toStringAsFixed(2)}",
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              "Placed on: ${DateFormat('dd MMM yyyy').format(createdAt)}",
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
