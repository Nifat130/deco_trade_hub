import 'package:supabase_flutter/supabase_flutter.dart';

class RetailerOrderRepository {
  final supabase = Supabase.instance.client;

  Future<String> placeOrder({
    required String retailerStoreId,
    required String wholesalerStoreId,
    required List<Map<String, dynamic>> orderItems,
    required double totalAmount,
  }) async {
    // for (final item in orderItems) {
    //   final productId = item['product_id'];
    //   final response = await supabase.from('products').select('store_id').eq('id', productId).maybeSingle();
    //
    //   if (response == null || response['store_id'] != wholesalerStoreId) {
    //     throw Exception("Product does not belong to the expected wholesaler store.");
    //   }
    // }

    final orderInsert = await supabase
        .from('orders')
        .insert({
          'retailer_store_id': retailerStoreId,
          'wholesaler_store_id': wholesalerStoreId,
          'total_amount': totalAmount,
          'payment_status': 'paid',
          'order_status': 'pending',
        })
        .select()
        .single();

    final orderId = orderInsert['id'];

    for (final item in orderItems) {
      await supabase.from('order_items').insert({
        'order_id': orderId,
        'product_id': item['product_id'],
        'quantity': item['quantity'],
        'unit_price': item['unit_price'],
      });

    
      await supabase.rpc('decrement_product_stock', params: {
        'product_id': item['product_id'],
        'quantity': item['quantity'],
      });
    }

    return orderId;
  }
}
