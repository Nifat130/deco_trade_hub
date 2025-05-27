import 'package:app_ui/app_ui.dart';
import 'package:deco_trade_hub/features/store/presentation/shared/widget/store_stats_card.dart';
import 'package:deco_trade_hub/ui/widgets/global/custom_appbar.dart';
import 'package:flutter/material.dart';

import '../../../../signout_button.dart';
import '../../../../store/presentation/shared/widget/store_profile_header.dart';

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
    print('init triggered');
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
          children: [
            StoreProfileHeader(
              profileUrl: 'Q',
              coverUrl: 'https://randomuser.me/api/portraits/men/32.jpg',
              storeName: 'Wholesaler Store',
              storeOwner: 'John Doe',
            ),
            // Stats Cards
            StoreStatsCard(
              title: 'Total Orders',
              value: '20',
              icon: Icons.shopping_bag_outlined,
              color: Colors.orangeAccent,
            ),
            const SizedBox(height: 16),
            StoreStatsCard(
              title: 'Total Earnings',
              value: '₹45,000',
              icon: Icons.attach_money,
              color: Colors.greenAccent,
            ),
            const SizedBox(height: 16),
            StoreStatsCard(
              title: 'Pending Shipments',
              value: '5',
              icon: Icons.local_shipping_outlined,
              color: Colors.redAccent,
            ),
          ],
        ),
      ),
    );
  }
}
