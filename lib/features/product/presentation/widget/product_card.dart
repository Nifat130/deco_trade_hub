import 'package:app_ui/app_ui.dart';
import 'package:deco_trade_hub/core/shimmers/dummy_db/dummy_product.dart';
import 'package:deco_trade_hub/core/utils/constants/app_colors.dart';
import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:deco_trade_hub/features/product/model/product_model.dart';
import 'package:deco_trade_hub/features/retailer_cart/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final double width;
  final VoidCallback? onTap;
  final bool isWholesaler;

  const ProductCard({
    super.key,
    required this.product,
    this.width = 160,
    this.onTap,
    this.isWholesaler = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width.w,
        margin: EdgeInsets.symmetric(horizontal: 8.w),
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ImageAttachmentThumbnail(
                  height: 120.h,
                  width: width.w,
                  fit: BoxFit.cover,
                  borderRadius: BorderRadius.circular(8),
                  imageUrl: product.avatarImage ?? dummyImageUrl,
                ),
                if (product.isOnOffer == true)
                  Positioned(
                    top: 6,
                    left: 6,
                    child: _buildBadge("OFFER", Colors.red),
                  ),
                if (product.isNewArrival == true)
                  Positioned(
                    top: 6,
                    right: 6,
                    child: _buildBadge("NEW", Colors.green),
                  ),
              ],
            ),
            SizedBox(height: 8.h),
            Text(
              product.name ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              product.description ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12.sp),
            ),
            SizedBox(height: 5.h),
            _buildPriceSection(),
            SizedBox(height: 5.h),
            if (!isWholesaler)
              GetBuilder<RetailerCartController>(
                builder: (cartController) {
                  final isInCart = cartController.isProductInCart(product.id);
                  return isInCart ? CartControls(productId: product.id) : AddToCartButton(product: product);
                },
              ),
            // if (isInCart) CartControls(product.id) else AddToCartButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceSection() {
    final hasOffer = product.isOnOffer == true && product.offerPrice != null;

    return hasOffer
        ? Row(
            children: [
              Text(
                "₹${product.price?.toStringAsFixed(0) ?? '--'}",
                style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: Colors.grey,
                  fontSize: 12.sp,
                ),
              ),
              SizedBox(width: 6.w),
              Text(
                "₹${product.offerPrice?.toStringAsFixed(0)}",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
              ),
            ],
          )
        : Text(
            "₹${product.price?.toStringAsFixed(0) ?? '--'}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            ),
          );
  }

  Widget _buildBadge(String text, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 10.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class CartControls extends StatelessWidget {
  final String productId;

  const CartControls({
    Key? key,
    required this.productId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RetailerCartController>(builder: (cartController) {
      final item = cartController.items.firstWhere((item) => item.product.id == productId);
      final stockQuantity = item.product.stockQuantity ?? 0;

      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.remove_circle_outline, color: AppColors.primary, size: 22.sp),
            onPressed: () => cartController.decreaseQuantity(productId),
          ),

          Text(
            item.quantity.toString(),
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),

          IconButton(
            icon: Icon(Icons.add_circle_outline, color: AppColors.primary, size: 22.sp),
            onPressed: () {
              if (item.quantity < stockQuantity) {
                cartController.increaseQuantity(productId);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Only $stockQuantity item(s) available in stock")),
                );
              }
            },
          ),

          // Delete Button
          IconButton(
            icon: Icon(Icons.delete_forever, color: Colors.redAccent, size: 22.sp),
            onPressed: () => cartController.removeFromCart(productId),
          ),
        ],
      );
    });
  }
}

class AddToCartButton extends StatelessWidget {
  final ProductModel product;

  const AddToCartButton({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RetailerCartController>(builder: (cartController) {
      return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            visualDensity: VisualDensity.compact,
            // padding: EdgeInsets.symmetric(vertical: 6.h),
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () => cartController.addToCart(product),
          child: Text(
            'Add to Cart',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
            ),
          ),
        ),
      );
    });
  }
}
