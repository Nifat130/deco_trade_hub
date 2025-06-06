import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../whole_saler_product/model/product_model.dart';
import '../../../whole_saler_product/presentation/edit_product_page.dart';

class ProductListViewer extends StatelessWidget {
  final List<ProductModel> products;
  final double height;
  final double itemWidth;

  const ProductListViewer({
    super.key,
    required this.products,
    this.height = 300,
    this.itemWidth = 160,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        itemBuilder: (context, index) {
          final product = products[index];

          return GestureDetector(
            onTap: () {
              Get.to(() => EditProductScreen(product: product));

            },
            child: SizedBox(
              width: itemWidth.w,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image avatar or fallback icon
                    product.avatarImage != null
                        ? Image.network(
                            product.avatarImage!,
                            width: itemWidth.w,
                            height: 120.h,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Icon(Icons.broken_image, size: 40),
                          )
                        : Container(
                            width: itemWidth.w,
                            height: 120.h,
                            color: Colors.grey.shade200,
                            child: Icon(Icons.image_not_supported, size: 40),
                          ),
                    SizedBox(height: 5.h),
                    Text(
                      product.name ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      product.description ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.black87),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProductListViewerSkeleton extends StatelessWidget {
  const ProductListViewerSkeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        itemBuilder: (context, index) {
          return SizedBox(
            width: 160.w,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Skeletonizer(
                    child: Container(
                      width: 160.w,
                      height: 120.h,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Skeletonizer(
                    child: Container(
                      width: 160.w * 0.7,
                      height: 20.h,
                      color: Colors.grey.shade300,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Skeletonizer(
                    child: Container(
                      width: 160.w * 0.9,
                      height: 40.h,
                      color: Colors.grey.shade300,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
