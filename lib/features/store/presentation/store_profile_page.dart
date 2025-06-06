import 'package:deco_trade_hub/features/store/model/store_model.dart';
import 'package:deco_trade_hub/features/store/presentation/shared/widget/store_owner_section_widget.dart';
import 'package:deco_trade_hub/features/store/presentation/shared/widget/store_profile_header.dart';
import 'package:deco_trade_hub/ui/widgets/global/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/router/app_routes.dart';
import 'controllers/store_controller.dart';

class StoreProfilePage extends StatefulWidget {
  const StoreProfilePage({super.key});

  @override
  State<StoreProfilePage> createState() => _StoreProfilePageState();
}

class _StoreProfilePageState extends State<StoreProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoreController>(
      builder: (controller) {
        return Scaffold(
          appBar: CustomAppBar(title: "Store Profile"),
          body: Builder(
            builder: (_) {
              if (controller.isLoadingStore) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.store == null) {
                return const Center(child: Text("Store not found"));
              }

              final store = controller.store!;
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: RefreshIndicator(
                  onRefresh: () async {
                    await controller.fetchStoreInfo();
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StoreProfileHeader(
                        coverUrl: store.storeBannerUrl ?? '',
                        profileUrl: store.storeLogoUrl ?? '',
                        storeName: store.storeName ?? '',
                        storeOwner: store.ownerId ?? '',
                        onEdit: () => Get.toNamed(AppRoutes.editStore, arguments: {'store': controller.store}),
                      ),
                      _StoreDetails(store),
                      const Divider(height: 40),
                      StoreOwnerSection(),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class _StoreDetails extends StatelessWidget {
  final StoreModel store;

  const _StoreDetails(this.store);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(store.storeDescription ?? "No description", style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: 16),
        if (store.contactNumber?.isNotEmpty == true) Text("📞 ${store.contactNumber}"),
        if (store.email?.isNotEmpty == true) Text("📧 ${store.email}"),
        if (store.addressLine1?.isNotEmpty == true) Text("🏠 ${store.addressLine1}, ${store.addressLine2 ?? ''}"),
        if (store.websiteUrl?.isNotEmpty == true) Text("🌐 ${store.websiteUrl}"),
        if (store.isVerified == true)
          const Padding(
            padding: EdgeInsets.only(top: 8),
            child: Chip(
              label: Text("Verified Store"),
              backgroundColor: Colors.greenAccent,
            ),
          ),
      ],
    );
  }
}
