import 'package:flutter/material.dart';

class StripePaymentView extends StatelessWidget {
  const StripePaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stripe Payment'),
      ),
      body: Center(
        child: Text('Stripe Payment View'),
      ),
    );
  }
}
