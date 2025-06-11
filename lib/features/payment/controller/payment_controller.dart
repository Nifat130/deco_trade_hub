import 'package:get/get.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PaymentController extends GetxController implements GetxService {
  Future<bool> initiateStripePayment({required double amount}) async {
    try {
      // 1. Create payment intent on Supabase (you need an RPC or Edge Function)
      final response = await Supabase.instance.client.rpc('create_payment_intent', params: {'amount': (amount * 100).toInt()}); // Stripe uses cents
      final clientSecret = response as String;

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
      Get.snackbar("Payment Error", e.toString());
      return false;
    }
  }
}
