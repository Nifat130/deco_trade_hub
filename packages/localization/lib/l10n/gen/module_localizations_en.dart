// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'module_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class ModuleALocalizationsEn extends ModuleALocalizations {
  ModuleALocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get noValueSelected => 'No value selected';

  @override
  String valueMustBeNumericLessThan(int max) {
    return 'Value must be numeric and less than $max characters';
  }

  @override
  String valueMustBeNumericBetween(int min, int max) {
    return 'Value must be numeric and between $min and $max characters';
  }

  @override
  String get valueCannotBeEmpty => 'Value cannot be empty';

  @override
  String get valueMustBeNumeric => 'Value must be numeric';

  @override
  String valueMustBeNumericWithLength(int length) {
    return 'Value must be numeric and have $length characters';
  }

  @override
  String valueMustBeBetween(int min, int max) {
    return 'Value must be between $min and $max characters';
  }

  @override
  String get cancel => 'Cancel';

  @override
  String get ok => 'Ok';

  @override
  String get back => 'Back';

  @override
  String get submit => 'Submit';

  @override
  String get next => 'Next';

  @override
  String get invalidEmailAddress => 'Invalid email address';

  @override
  String get oopsAnErrorHasOccurred => 'Oops, we encountered a serious error, please contact support!';

  @override
  String get connected => 'Connected';

  @override
  String get disconnected => 'Disconnected';

  @override
  String get networkErrorHasOccurred => 'A network error has occurred';

  @override
  String get requestCancelled => 'Request cancelled';

  @override
  String get generalApiErrorMessage => 'An error has occurred';
}
