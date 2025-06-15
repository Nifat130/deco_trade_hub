import 'package:app_ui/app_ui.dart';
import 'package:deco_trade_hub/core/shimmers/dummy_db/dummy_product.dart';
import 'package:deco_trade_hub/features/product/model/product_model.dart';
import 'package:deco_trade_hub/ui/widgets/global/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:deco_trade_hub/core/utils/constants/app_colors.dart';
import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../retailer_cart/controllers/cart_controller.dart';
import '../widget/product_card.dart';

class ProductDetailsView extends StatelessWidget {
  final ProductModel product;

  const ProductDetailsView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: product.name ?? 'Product Details',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              // product.avatarImage != null
              ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: ImageAttachmentThumbnail(
                    imageUrl: product.avatarImage ?? dummyImageUrl,
                    height: 250.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ))
              // : Container(
              //     height: 250.h,
              //     color: Colors.grey[300],
              //     child: Center(child: Text('No Image')),
              //   ),
              ,
              SizedBox(height: 16.h),

              // Product Info
              Text(
                product.name ?? '',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.h),

              Text(
                product.description ?? '',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 16.h),

              PriceSection(product: product),

              SizedBox(height: 16.h),

              ExtraInfoSection(product: product),

              SizedBox(height: 16.h),

              StockSection(product: product),

              SizedBox(height: 50.h),

              GetBuilder<RetailerCartController>(
                builder: (cartController) {
                  final isInCart = cartController.isProductInCart(product.id);
                  return isInCart ? CartControls(productId: product.id) : AddToCartButton(product: product);
                },
              ),            ],
          ),
        ),
      ),
    );
  }
}

  class PriceSection extends StatelessWidget {
    final ProductModel product;

    const PriceSection({Key? key, required this.product}) : super(key: key);

    @override
    Widget build(BuildContext context) {
    if (product.isOnOffer == true && product.offerPrice != null) {
      return Row(
        children: [
          Text(
            '\$${product.offerPrice!.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          SizedBox(width: 10.w),
          Text(
            '\$${product.price?.toStringAsFixed(2) ?? '0.00'}',
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.grey,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        ],
      );
    } else {
      return Text(
        '\$${product.price?.toStringAsFixed(2) ?? '0.00'}',
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
        ),
      );
    }
  }
  }

  class ExtraInfoSection extends StatelessWidget {
    final ProductModel product;

    const ExtraInfoSection({Key? key, required this.product}) : super(key: key);

    @override
    Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          if (product.category != null)
            InfoRow(title: "Category", value: product.category!),
          if (product.fabrics != null)
            InfoRow(title: "Fabrics", value: product.fabrics!),
          if (product.clothWidth != null)
            InfoRow(title: "Cloth Width", value: "${product.clothWidth} m"),
      ],
    );
  }
  }

  class StockSection extends StatelessWidget {
    final ProductModel product;

    const StockSection({Key? key, required this.product}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return InfoRow(
        title: "Stock",
        value: "${product.stockQuantity ?? 0} pieces available",
      );
    }
  }

  class InfoRow extends StatelessWidget {
    final String title;
    final String value;

    const InfoRow({Key? key, required this.title, required this.value}) : super(key: key);

    @override
    Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        children: [
          Text(
            "$title: ",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 16.sp),
            ),
          ),
        ],
      ),
    );
  }
}

