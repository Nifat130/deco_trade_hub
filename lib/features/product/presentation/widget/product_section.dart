import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:deco_trade_hub/features/product/presentation/retailer/retailer_product_list_viewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../core/shimmers/shimmer_product_list.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../controllers/retailer_product_controller.dart';
import '../../model/product_model.dart';

class ProductSection extends StatelessWidget {
  final String title;
  final Future<void> Function() fetchFn;
  final List<dynamic>? Function() selector;
  final bool Function() isLoading;

  const ProductSection({
    super.key,
    required this.title,
    required this.fetchFn,
    required this.selector,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            IconButton(
              icon: Icon(Icons.refresh, size: 18.sp, color: AppColors.primary),
              onPressed: fetchFn,
            ),
          ],
        ),
        SizedBox(height: 10.h),
        GetBuilder<RetailerProductController>(
          builder: (_) {
            if (isLoading()) {
              return ShimmerProductList();
            }

            final products = selector() as List<ProductModel>?;
            if (products == null || products.isEmpty) {
              return Text(
                "No products available.",
                style: TextStyle(color: Colors.grey),
              );
            }

            return RetailerProductListViewer(products: products);
          },
        ),
      ],
    );
  }
}
