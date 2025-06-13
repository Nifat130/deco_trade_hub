class RetailerOrder {
  final String id;
  final String orderNumber;
  final double totalAmount;
  final String orderStatus;
  final DateTime createdAt;

  RetailerOrder({
    required this.id,
    required this.orderNumber,
    required this.totalAmount,
    required this.orderStatus,
    required this.createdAt,
  });

  factory RetailerOrder.fromJson(Map<String, dynamic> json) {
    return RetailerOrder(
      id: json['id'] as String,
      orderNumber: json['order_number'] as String,
      totalAmount: (json['total_amount'] as num).toDouble(),
      orderStatus: json['order_status'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'order_number': orderNumber,
      'total_amount': totalAmount,
      'order_status': orderStatus,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
