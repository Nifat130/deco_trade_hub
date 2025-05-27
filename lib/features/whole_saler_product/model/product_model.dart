import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final String id;
  final String name;
  final String? description;
  final double price;
  final String? imageUrl;
  final String categoryId;
  final int stockQuantity;
  final bool isTrending;
  final bool isNewArrival;
  final bool isOnOffer;
  final double? offerPrice;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String storeId;

  const ProductModel({
    required this.id,
    required this.name,
    this.description,
    required this.price,
    this.imageUrl,
    required this.categoryId,
    required this.stockQuantity,
    this.isTrending = false,
    this.isNewArrival = false,
    this.isOnOffer = false,
    this.offerPrice,
    required this.createdAt,
    required this.updatedAt,
    required this.storeId,
  });

  factory ProductModel.fromJson(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      price: (map['price'] as num).toDouble(),
      imageUrl: map['image_url'],
      categoryId: map['category_id'],
      stockQuantity: map['stock_quantity'],
      isTrending: map['is_trending'] ?? false,
      isNewArrival: map['is_new_arrival'] ?? false,
      isOnOffer: map['is_on_offer'] ?? false,
      offerPrice: map['offer_price'] != null ? (map['offer_price'] as num).toDouble() : null,
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
      storeId: map['store_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'image_url': imageUrl,
      'category_id': categoryId,
      'stock_quantity': stockQuantity,
      'is_trending': isTrending,
      'is_new_arrival': isNewArrival,
      'is_on_offer': isOnOffer,
      'offer_price': offerPrice,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'store_id': storeId,
    };
  }

  Map<String, dynamic> toJsonForCreate() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'image_url': imageUrl,
      'category_id': categoryId,
      'stock_quantity': stockQuantity,
      'is_trending': isTrending,
      'is_new_arrival': isNewArrival,
      'is_on_offer': isOnOffer,
      'offer_price': offerPrice,
      'store_id': storeId,
    };
  }

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        price,
        imageUrl,
        categoryId,
        stockQuantity,
        isTrending,
        isNewArrival,
        isOnOffer,
        offerPrice,
        createdAt,
        updatedAt,
        storeId,
      ];
}
