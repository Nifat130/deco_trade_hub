import 'package:app_ui/app_ui.dart';
import 'package:deco_trade_hub/ui/widgets/global/custom_appbar.dart';
import 'package:flutter/material.dart';

import '../../../../signout_button.dart';

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
            HomeStatsCard(
              title: 'Total Orders',
              value: '20',
              icon: Icons.shopping_bag_outlined,
              color: Colors.orangeAccent,
            ),
            const SizedBox(height: 16),
            HomeStatsCard(
              title: 'Total Earnings',
              value: '₹45,000',
              icon: Icons.attach_money,
              color: Colors.greenAccent,
            ),
            const SizedBox(height: 16),
            HomeStatsCard(
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

class HomeStatsCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const HomeStatsCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: .2),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: .3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color.withValues(alpha: .8),
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
