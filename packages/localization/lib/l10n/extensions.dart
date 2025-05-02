// import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';
import 'package:localization/l10n/gen/module_localizations.dart';

export 'package:localization/l10n/gen/module_localizations.dart';

/// Extension methods for [ModuleALocalizations].
extension AppLocalizationsExtension on BuildContext {
  /// Returns the [ModuleALocalizations] instance from the closest
  /// [Localizations] ancestor.
  ModuleALocalizations get appLocalizations => ModuleALocalizations.of(this);
}

/// Extension methods for [BuildContext].
extension AppLocalizationsNullableExtension on BuildContext? {
  /// Returns the [ModuleALocalizations] instance from the closest
  ModuleALocalizations? get appLocalizations => this?.appLocalizations;
}
