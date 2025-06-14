import 'package:flutter/material.dart';

enum OrderStatus {
  pending,
  processing,
  delivered,
  completed;

  static OrderStatus fromString(String value) {
    return OrderStatus.values.firstWhere(
      (e) => e.name == value,
      orElse: () => OrderStatus.pending,
    );
  }

  String toJson() => name;
}

extension OrderStatusExtension on OrderStatus {
  String get label {
    switch (this) {
      case OrderStatus.pending:
        return 'Pending';
      case OrderStatus.processing:
        return 'Processing';
      case OrderStatus.delivered:
        return 'Delivered';
      case OrderStatus.completed:
        return 'Completed';
    }
  }

  Color get color {
    switch (this) {
      case OrderStatus.pending:
        return Colors.orangeAccent;
      case OrderStatus.processing:
        return Colors.blueAccent;
      case OrderStatus.delivered:
        return Colors.deepPurple;
      case OrderStatus.completed:
        return Colors.green;
    }
  }
}

// order_status_helper.dart

class OrderStatusBadge extends StatelessWidget {
  final OrderStatus status;
  final double fontSize;
  const OrderStatusBadge({super.key, required this.status, this.fontSize = 14});

  Color _getColor() {
    switch (status) {
      case OrderStatus.pending:
        return Colors.orange;
      case OrderStatus.processing:
        return Colors.blue;
      case OrderStatus.delivered:
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: _getColor().withValues(alpha: .2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        status.name.toUpperCase(),
        style: TextStyle(
          color: _getColor(),
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
