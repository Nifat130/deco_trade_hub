import 'package:app_ui/app_ui.dart';
import 'package:deco_trade_hub/core/shimmers/dummy_db/dummy_product.dart';
import 'package:deco_trade_hub/features/Authentication/data/data_source/store_session.dart';
import 'package:deco_trade_hub/features/retailer_order/controllers/retailer_order_controller.dart';
import 'package:deco_trade_hub/ui/widgets/global/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:deco_trade_hub/core/utils/constants/app_colors.dart';

import '../controllers/cart_controller.dart';
import '../model/cart_model.dart';

class RetailerCartView extends StatelessWidget {
  const RetailerCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Your Cart',
        centerTitle: true,
      ),
      body: GetBuilder<RetailerCartController>(
        builder: (cartController) {
          if (cartController.items.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart_outlined, size: 50.w, color: Colors.grey),
                  SizedBox(height: 16.h),
                  Text(
                    'Your cart is empty',
                    style: TextStyle(fontSize: 18.sp, color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(16.w),
                  itemCount: cartController.items.length,
                  itemBuilder: (context, index) {
                    final item = cartController.items[index];
                    return CartItemCard(item: item, cartController: cartController);
                  },
                ),
              ),
              CartTotalSection(cartController: cartController),
            ],
          );
        },
      ),
    );
  }
}

class CartItemCard extends StatelessWidget {
  final CartItem item;
  final RetailerCartController cartController;

  const CartItemCard({
    super.key,
    required this.item,
    required this.cartController,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppColors.primary.withValues(alpha: 0.09),
      margin: EdgeInsets.only(bottom: 16.h),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: ImageAttachmentThumbnail(
                imageUrl: item.product.avatarImage ?? dummyImageUrl,
                width: 80.w,
                height: 80.w,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.product.name ?? '',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    '₹${item.totalPrice.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove, size: 18.sp),
                        onPressed: () => cartController.decreaseQuantity(item.product.id),
                      ),
                      Text(
                        item.quantity.toString(),
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      IconButton(
                        icon: Icon(Icons.add, size: 18.sp),
                        onPressed: () => cartController.increaseQuantity(item.product.id),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => cartController.removeFromCart(item.product.id),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartTotalSection extends StatelessWidget {
  final RetailerCartController cartController;

  const CartTotalSection({super.key, required this.cartController});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        children: [
          TotalRow(label: 'Subtotal', value: cartController.subtotal),
          TotalRow(label: 'Delivery Fee', value: cartController.deliveryFee),
          TotalRow(label: 'VAT (5%)', value: cartController.vat),
          Divider(height: 24.h),
          TotalRow(
            label: 'Total',
            value: cartController.total,
            isTotal: true,
          ),
          SizedBox(height: 16.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 14.h),
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                Get.find<RetailerOrderController>().placeOrder(
                  retailerStoreId: Get.find<StoreSessionService>().storeId ?? '',
                  cartItems: cartController.items,
                );

                // cartController.placeOrder(); // Implement your order placement logic here

                // Get.snackbar(
                //   'Order Placed',
                //   'Your order has been placed successfully!',
                //   snackPosition: SnackPosition.BOTTOM,
                // );
              },
              child: Text(
                'Place Order (₹${cartController.total.toStringAsFixed(2)})',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TotalRow extends StatelessWidget {
  final String label;
  final double value;
  final bool isTotal;

  const TotalRow({
    super.key,
    required this.label,
    required this.value,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey[600],
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            '₹${value.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 14.sp,
              color: isTotal ? AppColors.primary : Colors.black,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
