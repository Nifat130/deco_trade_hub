import 'package:deco_trade_hub/features/product/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:deco_trade_hub/features/product/presentation/widget/product_list_viewer.dart';
import 'package:deco_trade_hub/ui/widgets/global/custom_appbar.dart';
import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:deco_trade_hub/core/utils/constants/app_colors.dart';
import '../../../../../core/shimmers/shimmer_product_list.dart';
import '../../../../product/controllers/retailer_product_controller.dart';

class RetailerHomePage extends StatelessWidget {
  const RetailerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const RetailerHomeView();
  }
}

class RetailerHomeView extends StatefulWidget {
  const RetailerHomeView({super.key});

  @override
  State<RetailerHomeView> createState() => _RetailerHomeViewState();
}

class _RetailerHomeViewState extends State<RetailerHomeView> {
  final RetailerProductController _controller = Get.find<RetailerProductController>();

  @override
  void initState() {
    super.initState();
    _controller.fetchTrendingProducts();
    _controller.fetchNewArrivalProducts();
    _controller.fetchOfferedProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Retailer Dashboard',
        isBackButtonExist: false,
      ),
      body: GetBuilder<RetailerProductController>(
        builder: (retailerProductController) {
          return RefreshIndicator(
            onRefresh: () async {
              await _controller.loadRetailerProducts();
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductSection(
                    title: "🔥 Trending Products",
                    fetchFn: _controller.fetchTrendingProducts,
                    selector: () => _controller.trendingProducts,
                    isLoading: () => _controller.isLoadingTrending,
                  ),
                  SizedBox(height: 20.h),
                  ProductSection(
                    title: "🆕 New Arrivals",
                    fetchFn: _controller.fetchNewArrivalProducts,
                    selector: () => _controller.newArrivals,
                    isLoading: () => _controller.isLoadingNewArrivals,
                  ),
                  SizedBox(height: 20.h),
                  ProductSection(
                    title: "💰 Offered Products",
                    fetchFn: _controller.fetchOfferedProducts,
                    selector: () => _controller.offeredProducts,
                    isLoading: () => _controller.isLoadingOffers,
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

            return ProductListViewer(products: products);
          },
        ),
      ],
    );
  }
}
