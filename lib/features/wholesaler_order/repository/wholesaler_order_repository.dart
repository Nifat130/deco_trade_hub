import 'package:deco_trade_hub/features/retailer_order/model/order_models.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/utils/helpers/supabase_helper.dart';
import '../../../services/global/failures.dart';
import '../model/wholesaler_order_model.dart';

class WholesalerOrderRepository {
  final supabase = Supabase.instance.client;

  Future<Either<Failure, List<WholesalerOrder>>> fetchWholesalerOrders(String wholesalerStoreId) async {
    return safeSupabaseCall(() async {
      final response = await supabase
          .from('orders')
          .select('id, order_number, total_amount, order_status, created_at')
          .eq('wholesaler_store_id', wholesalerStoreId)
          .order('created_at', ascending: false);
      return (response as List).map((e) => WholesalerOrder.fromJson(e as Map<String, dynamic>)).toList();
    });
  }

  // Future<Either<Failure, OrderDetailsModel>> getOrderDetails(String orderId) async {
  //   return safeSupabaseCall(() async {
  //     final response = await supabase.from('orders').select('''
  //       id,
  //       order_number,
  //       total_amount,
  //       order_status,
  //       delivery_address,
  //       created_at,
  //       retailer_store:retailer_store_id (
  //         id,
  //         store_name,
  //         address_line1,
  //         store_logo_url
  //       ),
  //       order_items (
  //         id,
  //         quantity,
  //         unit_price,
  //         total_price,
  //         product:product_id (
  //           id,
  //           name,
  //           avatar_image
  //         )
  //       )
  //     ''').eq('id', orderId).maybeSingle();
  //     if (response == null) {
  //       throw Failure('Order not found');
  //     }
  //     return OrderDetailsModel.fromJson(response);
  //   });
  // }

  Future<Either<Failure, OrderDetailsModel>> getOrderDetails(String orderId) async {
    return safeSupabaseCall(() async {
      // final storeAlias = isRetailer ? 'retailer_store:retailer_store_id' : 'wholesaler_store:wholesaler_store_id';

      final storeAlias = 'retailer_store:retailer_store_id';

      final response = await supabase.from('orders').select('''
      id,
      order_number,
      total_amount,
      order_status,
      delivery_address,
      created_at,
      $storeAlias (
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
}
