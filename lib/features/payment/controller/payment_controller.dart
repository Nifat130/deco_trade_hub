import 'package:get/get.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:shared/shared.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PaymentController extends GetxController implements GetxService {
  Future<bool> initiateStripePayment({required double amount}) async {
    try {
      final response = await Supabase.instance.client.functions.invoke(
        'create-payment-intent',
        body: {
          'amount': (amount * 100).toInt(),
          'currency': 'inr',
        },
      ); // Stripe uses cents

      final clientSecret = response.data['clientSecret'] as String;

      logD("Payment Intent created with client secret: $clientSecret");
      // 2. Initialize Stripe payment sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: "Deco Trade Hub",
        ),
      );

      // 3. Present payment sheet
      await Stripe.instance.presentPaymentSheet();
      return true;
    } catch (e) {
      logE('Payment error: $e');
      // Get.snackbar("Payment Error", e.toString());
      return false;
    }
  }
}
