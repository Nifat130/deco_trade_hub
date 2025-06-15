import 'package:deco_trade_hub/features/product/presentation/widget/product_card.dart';
import 'package:flutter/material.dart';
import 'package:deco_trade_hub/features/product/model/product_model.dart';
import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'product_details_page.dart';

class RetailerProductListViewer extends StatelessWidget {
  final List<ProductModel> products;
  final double height;
  final double itemWidth;

  const RetailerProductListViewer({
    super.key,
    required this.products,
    this.height = 270,
    this.itemWidth = 170,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        padding: EdgeInsets.symmetric(vertical: 5.h),
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductCard(
            product: product,
            width: itemWidth,
            onTap: () {
              Get.to(() => ProductDetailsView(product: product));
            },
          );
        },
      ),
    );
  }
}
