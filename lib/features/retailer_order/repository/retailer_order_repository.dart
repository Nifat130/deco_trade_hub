import 'package:shared/shared.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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

      logD(' ------- placing order ------- inserted order item for product ${item['product_id']} with quantity $quantity and total price $totalPrice');

      await supabase.rpc('decrement_product_stock', params: {
        'product_id': item['product_id'],
        'quantity': quantity,
      });
      logD(' ------- placing order ------- decremented stock for product ${item['product_id']} by $quantity');

    }

    return orderId;
  }
}
