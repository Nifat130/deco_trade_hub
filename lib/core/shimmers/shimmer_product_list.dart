import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../features/product/presentation/widget/product_card.dart';
import 'dummy_db/dummy_product.dart';


class ShimmerProductList extends StatelessWidget {
  const ShimmerProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: Skeletonizer(
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (_, __) =>  Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ProductCard(product: dummyProduct),
            )),
      ),
    );
  }
}