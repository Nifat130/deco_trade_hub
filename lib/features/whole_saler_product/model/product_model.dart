import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final String id;
  final String? name;
  final String? description;
  final double? price;
  final String? avatarImage;
  final List<String>? productImages;
  final String? category;
  final String? fabrics;
  final double? clothWidth;
  final int? stockQuantity;
  final bool? isTrending;
  final bool? isNewArrival;
  final bool? isOnOffer;
  final double? offerPrice;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? storeId;

  const ProductModel({
    required this.id,
    this.name,
    this.description,
    this.price,
    this.avatarImage,
    this.productImages,
    this.category,
    this.fabrics,
    this.clothWidth,
    this.stockQuantity,
    this.isTrending = false,
    this.isNewArrival = true,
    this.isOnOffer = false,
    this.offerPrice,
    this.createdAt,
    this.updatedAt,
    this.storeId,
  });

  factory ProductModel.fromJson(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      name: map['name'] as String?,
      description: map['description'] as String?,
      price: (map['price'] as num?)?.toDouble(),
      avatarImage: map['avatar_image'] as String?,
      category: map['category'] as String?,
      fabrics: map['fabrics'] as String?,
      clothWidth: (map['cloth_width'] as num?)?.toDouble(),
      stockQuantity: map['stock_quantity'] as int?,
      isTrending: map['is_trending'] ?? false,
      isNewArrival: map['is_new_arrival'] ?? false,
      productImages: (map['product_images'] as List<dynamic>?)?.map((image) => image as String).toList(),
      isOnOffer: map['is_on_offer'] ?? false,
      offerPrice: (map['offer_price'] as num?)?.toDouble(),
      createdAt: map['created_at'] != null ? DateTime.parse(map['created_at']) : null,
      updatedAt: map['updated_at'] != null ? DateTime.parse(map['updated_at']) : null,
      storeId: map['store_id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'avatar_image': avatarImage,
      'category': category,
      'fabrics': fabrics,
      'cloth_width': clothWidth,
      'stock_quantity': stockQuantity,
      'is_trending': isTrending,
      'is_new_arrival': isNewArrival,
      'is_on_offer': isOnOffer,
      'offer_price': offerPrice,
      'product_images': productImages,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'store_id': storeId,
    };
  }

  Map<String, dynamic> toJsonForCreate() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'avatar_image': avatarImage,
      'category': category,
      'fabrics': fabrics,
      'cloth_width': clothWidth,
      'product_images': productImages,
      'stock_quantity': stockQuantity,
      'is_trending': isTrending,
      'is_new_arrival': isNewArrival,
      'is_on_offer': isOnOffer,
      'offer_price': offerPrice,
      'store_id': storeId,
    };
  }

  Map<String, dynamic> toJsonForUpdate() {
    final data = <String, dynamic>{};

    if (id.isNotEmpty) data['id'] = id;
    if (name != null) data['name'] = name;
    if (description != null) data['description'] = description;
    if (price != null) data['price'] = price;
    if (offerPrice != null) data['offer_price'] = offerPrice;
    if (category != null) data['category'] = category;
    if (fabrics != null) data['fabrics'] = fabrics;
    if (clothWidth != null) data['cloth_width'] = clothWidth;
    if (stockQuantity != null) data['stock_quantity'] = stockQuantity;
    if (isTrending != null) data['is_trending'] = isTrending;
    if (isNewArrival != null) data['is_new_arrival'] = isNewArrival;
    if (isOnOffer != null) data['is_on_offer'] = isOnOffer;
    if (storeId != null) data['store_id'] = storeId;

    return data;
  }

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        price,
        avatarImage,
        productImages,
        category,
        fabrics,
        clothWidth,
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
