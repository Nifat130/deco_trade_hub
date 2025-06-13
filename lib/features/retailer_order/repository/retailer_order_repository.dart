import 'package:deco_trade_hub/features/retailer_order/model/order_models.dart';
import 'package:fpdart/fpdart.dart';
import 'package:shared/shared.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/utils/helpers/supabase_helper.dart';
import '../../../services/global/failures.dart';

class RetailerOrderRepository {
  final supabase = Supabase.instance.client;

  Future<String> placeOrder({
    required String retailerStoreId,
    required String wholesalerStoreId,
    required List<Map<String, dynamic>> orderItems,
    required double totalAmount,
    required String stripePaymentIntentId,
    required String address,
  }) async {
    logD(' ------- placing order ------- 1');
    final orderInsert = await supabase
        .from('orders')
        .insert({
          'retailer_store_id': retailerStoreId,
          'wholesaler_store_id': wholesalerStoreId,
          'total_amount': totalAmount,
          'stripe_payment_intent_id': stripePaymentIntentId,
          'delivery_address': address,
          'order_number': 'ORD-${DateTime.now().millisecondsSinceEpoch}',
          'payment_status': 'paid',
          'order_status': 'pending',
        })
        .select()
        .single();
    logD(' ------- placing order ------- 2 ${orderInsert['id']}');

    final orderId = orderInsert['id'];

    for (final item in orderItems) {
      final quantity = item['quantity'] as int;
      final unitPrice = (item['unit_price'] as num).toDouble();
      final totalPrice = quantity * unitPrice;

      await supabase.from('order_items').insert({
        'order_id': orderId,
        'product_id': item['product_id'],
        'quantity': quantity,
        'unit_price': unitPrice,
        'total_price': totalPrice,
      });

      logD(
          ' ------- placing order ------- inserted order item for product ${item['product_id']} with quantity $quantity and total price $totalPrice');

      await supabase.rpc('decrement_product_stock', params: {
        'product_id': item['product_id'],
        'quantity': quantity,
      });
      logD(' ------- placing order ------- decremented stock for product ${item['product_id']} by $quantity');
    }

    return orderId;
  }

  Future<List<Map<String, dynamic>>> fetchRetailerOrders(String retailerStoreId) async {
    final response = await supabase
        .from('orders')
        .select('id, order_number, total_amount, order_status, created_at')
        .eq('retailer_store_id', retailerStoreId)
        .order('created_at', ascending: false);

    return response;
  }

  //  Future<Either<Failure, List<ProductModel>>> getProductsByStore() {
  //     return safeSupabaseCall(() async {
  //       final response = await supabaseClient.from('products').select().eq('store_id', storeId).order('created_at', ascending: false);
  //       return (response as List).map((e) => ProductModel.fromJson(e)).toList();
  //     });
  //   }

  Future<Either<Failure, OrderDetailsModel>> getOrderDetails(String orderId) async {
    return safeSupabaseCall(() async {
      final response = await supabase.from('orders').select('''
        id,
        order_number,
        total_amount,
        order_status,
        delivery_address,
        created_at,
        wholesaler_store:wholesaler_store_id (
          id,
          store_name,
          address_line1,
          store_logo_url
        ),
        order_items (
          id,
          quantity,
          unit_price,
          total_price,
          product:product_id (
            id,
            name,
            avatar_image
          )
        )
      ''').eq('id', orderId).maybeSingle();
      if (response == null) {
        throw Failure('Order not found');
      }
      return OrderDetailsModel.fromJson(response);
    });
  }

  /// response is a map with order details
//{
//   "id": "order-id",
//   "order_number": "ORD-001",
//   "total_amount": 150.0,
//   "order_status": "pending",
//   "delivery_address": "Dummy Address",
//   "created_at": "...",
//   "wholesaler_store": {
//     "id": "store-id",
//     "store_name": "XYZ Store",
//     "address_line1": "Some Address",
//     "store_logo_url": "..."
//   },
//   "order_items": [
//     {
//       "id": "order-item-id",
//       "quantity": 2,
//       "unit_price": 50.0,
//       "total_price": 100.0,
//       "product": {
//         "id": "product-id",
//         "name": "Product A",
//         "avatar_image": "..."
//       }
//     }
//   ]
// }
}
