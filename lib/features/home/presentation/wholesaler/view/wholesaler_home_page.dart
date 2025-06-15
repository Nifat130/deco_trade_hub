import 'package:app_ui/app_ui.dart';
import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:deco_trade_hub/features/home/presentation/shared/listview_widget.dart';
import 'package:deco_trade_hub/ui/widgets/global/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../ui/nifat/widgets/custom_text.dart';
import '../../../../product/controllers/wholesaler_product_controller.dart';
import '../../../../signout_button.dart';
import '../../../../store/presentation/controllers/store_controller.dart';
import '../../shared/dashboard_header.dart';

class WholesalerHomePage extends StatelessWidget {
  const WholesalerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WholesalerHomeView();
  }
}

class WholesalerHomeView extends StatefulWidget {
  const WholesalerHomeView({super.key});

  @override
  State<WholesalerHomeView> createState() => _WholesalerHomeViewState();
}

class _WholesalerHomeViewState extends State<WholesalerHomeView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<StoreController>().fetchStoreInfo();
      Get.find<WholesalerProductController>().fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Text(
                'Wholesaler Menu',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            SignOutButton(),
          ],
        ),
      ),
      appBar: CustomAppBar(
        isBackButtonExist: false,
        title: 'Wholesaler Dashboard',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GetBuilder<WholesalerProductController>(builder: (productController) {
              return Padding(
                padding: EdgeInsets.only(left: 16.w, top: 20.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeDashboardHeader(),
                    CustomText(
                      text: "New Arrivals",
                      fontSize: 16.w,
                    ),
                    SizedBox(height: 8.h),
                    productController.allProducts == null
                        ? ProductListViewerSkeleton()
                        : ProductListViewer(
                            products: productController.allProducts!,
                            isWholesaler: true,
                          ),
                    SizedBox(height: 8.h),
                  ],
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
