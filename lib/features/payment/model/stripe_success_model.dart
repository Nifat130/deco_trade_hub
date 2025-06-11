
class StripeSuccessModel {
  final String clientSecret;
  final String paymentIntentId;

  StripeSuccessModel({
    required this.clientSecret,
    required this.paymentIntentId,
  });
}