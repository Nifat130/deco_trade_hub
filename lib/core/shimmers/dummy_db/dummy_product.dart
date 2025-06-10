import '../../../features/product/model/product_model.dart';

String dummyImageUrl = 'https://dummyimage.com/600x400/000/fff';

ProductModel dummyProduct = ProductModel(
  id: 'prod_001',
  name: 'Elegant Silk Saree',
  description: 'A beautiful hand-woven silk saree with intricate floral patterns, perfect for special occasions.',
  price: 120.00,
  avatarImage: dummyImageUrl,
  productImages: [
    dummyImageUrl,
  ],
  category: 'Women\'s Apparel',
  fabrics: 'Pure Silk',
  clothWidth: 1.2,
  // meters
  stockQuantity: 50,
  isTrending: false,
  isNewArrival: false,
  isOnOffer: false,
  offerPrice: 99.99,
  createdAt: DateTime(2024, 5, 10, 14, 30),
  updatedAt: DateTime(2025, 6, 8, 10, 0),
  storeId: 'store_abc',
);
