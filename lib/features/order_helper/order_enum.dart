import 'package:flutter/material.dart';

/// for domain layer
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

/// for presentation layer
extension OrderStatusExtension on OrderStatus {
  String get labelForWholesaler {
    switch (this) {
      case OrderStatus.pending:
        return 'Pending';
      case OrderStatus.processing:
        return 'Need to deliver';
      case OrderStatus.delivered:
        return 'Delivered to customer';
      case OrderStatus.completed:
        return 'Completed';
    }
  }

  String get labelForRetailer {
    switch (this) {
      case OrderStatus.pending:
        return 'Pending';
      case OrderStatus.processing:
        return 'Being Prepared';
      case OrderStatus.delivered:
        return 'Out for Delivery';
      case OrderStatus.completed:
        return 'Order Closed';
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
