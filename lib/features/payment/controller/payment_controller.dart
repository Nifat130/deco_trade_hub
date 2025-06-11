import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:shared/shared.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../services/global/failures.dart';
import '../model/stripe_success_model.dart';

class PaymentController extends GetxController implements GetxService {
  Future<Either<Failure, StripeSuccessModel>> initiateStripePayment({required double amount}) async {
    try {
      final response = await Supabase.instance.client.functions.invoke(
        'create-payment-intent',
        body: {
          'amount': (amount * 100).toInt(),
          'currency': 'inr',
        },
      ); // Stripe uses cents

      logD(response.data);

      final clientSecret = response.data['clientSecret'] as String;
      final paymentIntentId = response.data['paymentIntentId'] as String;

      logD("Payment Intent created with client secret: $clientSecret");

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: "Deco Trade Hub",
        ),
      );

      await Stripe.instance.presentPaymentSheet();

      // Return Right after successful payment
      return right(StripeSuccessModel(
        clientSecret: clientSecret,
        paymentIntentId: paymentIntentId,
      ));
    } catch (e) {
      logE('Payment error: $e');
      // You can customize this failure model however you're using it globally
      return left(Failure(e.toString()));
    }
  }
}
