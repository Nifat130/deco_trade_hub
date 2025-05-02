import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:localization/l10n/extensions.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    super.key,
    this.errorMessage,
  });

  final String? errorMessage;

  static const routeName = 'error_screen';

  @override
  Widget build(BuildContext context) {
    return BaseScreenWidget(
      body: Center(
        child: Text(
          errorMessage ?? context.appLocalizations.oopsAnErrorHasOccurred,
          style: context.appTextTheme.body3,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
