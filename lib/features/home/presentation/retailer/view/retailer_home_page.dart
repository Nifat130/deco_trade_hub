import 'package:app_ui/app_ui.dart';
import 'package:deco_trade_hub/ui/widgets/global/language_dropdown.dart';
import 'package:deco_trade_hub/ui/widgets/global/theme_switch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:localization/localization.dart';

import '../../../../../ui/widgets/global/custom_appbar.dart';
import '../../../../signout_button.dart';
import '../../../../store/presentation/controllers/store_controller.dart';

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

  @override
  void initState() {
    Get.find<StoreController>().fetchStoreInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(
        isBackButtonExist: false,
        title: 'Retailer Dashboard',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

          ],
        ),
      ),
    );
  }
}
