import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:deco_trade_hub/features/home/presentation/retailer/view/retailer_promotional_banners.dart';
import 'package:deco_trade_hub/features/signout_button.dart';
import 'package:deco_trade_hub/features/store/presentation/controllers/store_controller.dart';
import 'package:deco_trade_hub/ui/widgets/global/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../product/controllers/retailer_product_controller.dart';
import '../../../../product/presentation/widget/product_section.dart';

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
  final StoreController _storeController = Get.find<StoreController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _refreshData();
    });
  }

  Future<void> _refreshData() async {
    _storeController.fetchTrendingStores();
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
              await _refreshData();
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CupertinoSearchTextField(),
                  const SizedBox(height: 16),
                  // PromotionalBanners(),
                  TrendingStoresSection(),
                  // SizedBox(height:500, child: CarouselExample()),
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

                  SignOutButton()
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
