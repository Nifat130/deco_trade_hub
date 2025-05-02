import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnBoardingPage1 extends StatelessWidget {
  const OnBoardingPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          'packages/app_ui/assets/lottie/onboarding_page_one_lottie.json',
        ),
        const SizedBox(height: 24),
        Text(
          'Welcome to Your Ultimate Home Decor Hub!',
          style: context.textTheme.headlineMedium
              ?.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          'Discover the best home decor items and manage your '
          'inventory with ease.',
          style: context.textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
