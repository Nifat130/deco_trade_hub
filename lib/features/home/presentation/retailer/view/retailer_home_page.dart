import 'package:app_ui/app_ui.dart';
import 'package:deco_trade_hub/ui/widgets/global/language_dropdown.dart';
import 'package:deco_trade_hub/ui/widgets/global/theme_switch.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

import '../../../../signout_button.dart';

class RetailerHomePage extends StatelessWidget {
  const RetailerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const RetailerHomeView();
  }
}

class RetailerHomeView extends StatelessWidget {
  const RetailerHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: const Text('Retailer Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ThemeSwitch(),
            const SizedBox(height: 20),
            Text(
              context.appLocalizations.connected,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(height: 20),
            const LanguageDropdown(),
            const SizedBox(height: 20),
            const SignOutButton(),
          ],
        ),
      ),
    );
  }
}
