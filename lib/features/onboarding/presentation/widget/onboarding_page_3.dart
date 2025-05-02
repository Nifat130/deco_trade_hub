import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnBoardingPage3 extends StatelessWidget {
  const OnBoardingPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          'packages/app_ui/${Assets.lottie.onboardingPageThreeLottie.path}',
        ),
        const SizedBox(height: 24),
        Text(
          'Showcase Your Unique Collection',
          style: context.textTheme.headlineMedium
              ?.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          'Let the world see your beautiful collections.'
          ' Your stores are publicly accessible, allowing other '
          'users to explore what you offer.',
          style: context.textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
