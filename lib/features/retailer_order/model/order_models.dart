// import '../../product/model/product_model.dart';
//
// class OrderItemModel {
//   final String id;
//   final int quantity;
//   final double unitPrice;
//   final double totalPrice;
//   final ProductModel product;
//
//   OrderItemModel({
//     required this.id,
//     required this.quantity,
//     required this.unitPrice,
//     required this.totalPrice,
//     required this.product,
//   });
//
//   factory OrderItemModel.fromJson(Map<String, dynamic> json) {
//     return OrderItemModel(
//       id: json['id'],
//       quantity: json['quantity'],
//       unitPrice: (json['unit_price'] as num).toDouble(),
//       totalPrice: (json['total_price'] as num).toDouble(),
//       product: ProductModel.fromJson(json['product']),
//     );
//   }
// }
//
// class OrderDetailsModel {
//   final String id;
//   final String orderNumber;
//   final double totalAmount;
//   final String orderStatus;
//   final String deliveryAddress;
//   final DateTime createdAt;
//   final StoreModel wholesalerStore;
//   final List<OrderItemModel> orderItems;
//
//   OrderDetailsModel({
//     required this.id,
//     required this.orderNumber,
//     required this.totalAmount,
//     required this.orderStatus,
//     required this.deliveryAddress,
//     required this.createdAt,
//     required this.wholesalerStore,
//     required this.orderItems,
//   });
//
//   factory OrderDetailsModel.fromJson(Map<String, dynamic> json) {
//     return OrderDetailsModel(
//       id: json['id'],
//       orderNumber: json['order_number'],
//       totalAmount: (json['total_amount'] as num).toDouble(),
//       orderStatus: json['order_status'],
//       deliveryAddress: json['delivery_address'],
//       createdAt: DateTime.parse(json['created_at']),
//       wholesalerStore: StoreModel.fromJson(json['wholesaler_store']),
//       orderItems: (json['order_items'] as List<dynamic>).map((e) => OrderItemModel.fromJson(e)).toList(),
//     );
//   }
// }
//
// class StoreModel {
//   final String id;
//   final String storeName;
//   final String? addressLine1;
//   final String? storeLogoUrl;
//
//   StoreModel({
//     required this.id,
//     required this.storeName,
//     this.addressLine1,
//     this.storeLogoUrl,
//   });
//
//   factory StoreModel.fromJson(Map<String, dynamic> json) {
//     return StoreModel(
//       id: json['id'],
//       storeName: json['store_name'],
//       addressLine1: json['address_line1'],
//       storeLogoUrl: json['store_logo_url'],
//     );
//   }
// }

import '../../product/model/product_model.dart';

// Store Model
class StoreModel {
  final String id;
  final String storeName;
  final String? addressLine1;
  final String? storeLogoUrl;

  StoreModel({
    required this.id,
    required this.storeName,
    this.addressLine1,
    this.storeLogoUrl,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) {
    return StoreModel(
      id: json['id'],
      storeName: json['store_name'],
      addressLine1: json['address_line1'],
      storeLogoUrl: json['store_logo_url'],
    );
  }
}

// Order Item Model
class OrderItemModel {
  final String id;
  final int quantity;
  final double unitPrice;
  final double totalPrice;
  final ProductModel product;

  OrderItemModel({
    required this.id,
    required this.quantity,
    required this.unitPrice,
    required this.totalPrice,
    required this.product,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      id: json['id'],
      quantity: json['quantity'],
      unitPrice: (json['unit_price'] as num).toDouble(),
      totalPrice: (json['total_price'] as num).toDouble(),
      product: ProductModel.fromJson(json['product']),
    );
  }
}

// Order Details Model
class OrderDetailsModel {
  final String id;
  final String orderNumber;
  final double totalAmount;
  final String orderStatus;
  final String deliveryAddress;
  final DateTime createdAt;
  final StoreModel store; // Unified field now (can be retailer OR wholesaler store)
  final List<OrderItemModel> orderItems;

  OrderDetailsModel({
    required this.id,
    required this.orderNumber,
    required this.totalAmount,
    required this.orderStatus,
    required this.deliveryAddress,
    required this.createdAt,
    required this.store,
    required this.orderItems,
  });

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    // Dynamically pick store key
    final storeJson = json['wholesaler_store'] ?? json['retailer_store'];

    return OrderDetailsModel(
      id: json['id'],
      orderNumber: json['order_number'],
      totalAmount: (json['total_amount'] as num).toDouble(),
      orderStatus: json['order_status'],
      deliveryAddress: json['delivery_address'],
      createdAt: DateTime.parse(json['created_at']),
      store: StoreModel.fromJson(storeJson),
      orderItems: (json['order_items'] as List<dynamic>).map((e) => OrderItemModel.fromJson(e)).toList(),
    );
  }
}
