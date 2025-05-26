import 'package:app_ui/app_ui.dart';
import 'package:deco_trade_hub/features/home/presentation/wholesaler/view/payment_page.dart';
import 'package:deco_trade_hub/features/profile/view/retailer/controller/retailer_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../payment/presentation/stripe/view/stripe_payment_view.dart';
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
  late final String name;

  @override
  void initState() {
    name = Get.find<RetailerProfileController>().getName();
    print(name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: const Text('Wholesaler Home Page'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Hello $name'),
            FilledButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaymentPage2()));
                },
                child: Text('Go to Stripe payment page')),
            const SizedBox(height: 20),
            FilledButton.tonalIcon(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => StripePaymentView()));
                },
                icon: Icon(Icons.payment),
                label: Text('Stripe Payment view')),
            const SignOutButton(),
          ],
        ),
      ),
    );
  }
}
