import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnBoardingPage2 extends StatelessWidget {
  const OnBoardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          'packages/app_ui/${Assets.lottie.onboardingPageTwoLottie.path}',
        ),
        const SizedBox(height: 24),
        Text(
          'Manage Your Stores with Ease',
          style: context.textTheme.headlineMedium
              ?.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          'Create and manage up to 5 stores effortlessly. '
          'Keep your customers informed with real-time updates.',
          style: context.textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
