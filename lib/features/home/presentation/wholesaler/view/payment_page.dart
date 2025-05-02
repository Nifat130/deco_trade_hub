import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:shared/shared.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Page'),
      ),
      body: Center(
        child: Text('Payment Page'),
      ),
    );
  }
}

class PaymentPage2 extends StatefulWidget {
  const PaymentPage2({super.key});

  @override
  State<PaymentPage2> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage2> {
  CardFieldInputDetails? _cardData;
  int _amount = 10;
  bool isLoading = false;

  Future<void> _pay(String orderId) async {
    setState(() {
      isLoading = true;
    });

    try {
      final response = await _createPaymentIntent(orderId, _amount);
      logE(response.data.toString());
      final paymentStatus = await Stripe.instance.confirmPayment(
        paymentIntentClientSecret: response.data,
        data: const PaymentMethodParams.card(
          paymentMethodData: PaymentMethodData(),
        ),
      );

      if (paymentStatus.status == PaymentIntentsStatus.Succeeded) {
        print('Succeeded');

        //show snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Payment succeeded')),
        );
      } else if (paymentStatus.status == PaymentIntentsStatus.Canceled) {
        print('Payment cancelled');
        //show snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Payment cancelled')),
        );
      }
    } catch (error) {
      logE(error.toString());

      if (!mounted) return;
      print(error);
    }

    setState(() {
      isLoading = false;
    });
  }

  Future<FunctionResponse> _createPaymentIntent(
      String orderId, int amount) async {
    final response = await Supabase.instance.client.functions
        .invoke('create_payment_intent', body: {
      'orderId': orderId,
      'amount': amount,
    });

    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                _amount.toStringAsFixed(2),
                style: const TextStyle(fontSize: 18),
              ),
              CardField(
                onCardChanged: (card) {
                  _cardData = card;
                },
              ),
              ElevatedButton(
                onPressed: isLoading
                    ? null
                    : () => _pay(
                        '3b9a7b59-ffc6-43c6-8282-510df255da86'), //your order id
                child: Text(isLoading ? 'Loading' : 'Pay'),
              ),
              ElevatedButton(
                onPressed: () {
                  // initPaymentSheet();
                }, //your order id
                child: Text('init'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
