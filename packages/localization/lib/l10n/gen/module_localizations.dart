import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'module_localizations_bn.dart';
import 'module_localizations_en.dart';
import 'module_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of ModuleALocalizations
/// returned by `ModuleALocalizations.of(context)`.
///
/// Applications need to include `ModuleALocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/module_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: ModuleALocalizations.localizationsDelegates,
///   supportedLocales: ModuleALocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the ModuleALocalizations.supportedLocales
/// property.
abstract class ModuleALocalizations {
  ModuleALocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static ModuleALocalizations of(BuildContext context) {
    return Localizations.of<ModuleALocalizations>(context, ModuleALocalizations)!;
  }

  static const LocalizationsDelegate<ModuleALocalizations> delegate = _ModuleALocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('bn'),
    Locale('en'),
    Locale('es')
  ];

  /// Text shown when no value is selected
  ///
  /// In en, this message translates to:
  /// **'No value selected'**
  String get noValueSelected;

  /// Text shown when the value is not numeric or is greater than the maximum allowed
  ///
  /// In en, this message translates to:
  /// **'Value must be numeric and less than {max} characters'**
  String valueMustBeNumericLessThan(int max);

  /// Text shown when the value is not numeric or is not between the minimum and maximum allowed
  ///
  /// In en, this message translates to:
  /// **'Value must be numeric and between {min} and {max} characters'**
  String valueMustBeNumericBetween(int min, int max);

  /// Text shown when the value is empty
  ///
  /// In en, this message translates to:
  /// **'Value cannot be empty'**
  String get valueCannotBeEmpty;

  /// Text shown when the value is not numeric
  ///
  /// In en, this message translates to:
  /// **'Value must be numeric'**
  String get valueMustBeNumeric;

  /// Text shown when the value is not numeric or does not have the required length
  ///
  /// In en, this message translates to:
  /// **'Value must be numeric and have {length} characters'**
  String valueMustBeNumericWithLength(int length);

  /// Text shown when the value is not between the minimum and maximum allowed
  ///
  /// In en, this message translates to:
  /// **'Value must be between {min} and {max} characters'**
  String valueMustBeBetween(int min, int max);

  /// Text shown in the cancel button
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Text shown in the ok button
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get ok;

  /// Text shown in the back button
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// Text shown in the submit button
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// Text shown in the next button
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// Text shown when the email address is invalid
  ///
  /// In en, this message translates to:
  /// **'Invalid email address'**
  String get invalidEmailAddress;

  /// Text shown when an error has occurred
  ///
  /// In en, this message translates to:
  /// **'Oops, we encountered a serious error, please contact support!'**
  String get oopsAnErrorHasOccurred;

  /// Text shown when the app is connected to the internet
  ///
  /// In en, this message translates to:
  /// **'Connected'**
  String get connected;

  /// Text shown when the app is disconnected from the internet
  ///
  /// In en, this message translates to:
  /// **'Disconnected'**
  String get disconnected;

  /// Text shown when a network error has occurred
  ///
  /// In en, this message translates to:
  /// **'A network error has occurred'**
  String get networkErrorHasOccurred;

  /// Text shown when a request has been cancelled
  ///
  /// In en, this message translates to:
  /// **'Request cancelled'**
  String get requestCancelled;

  /// Text shown when a general API error has occurred
  ///
  /// In en, this message translates to:
  /// **'An error has occurred'**
  String get generalApiErrorMessage;
}

class _ModuleALocalizationsDelegate extends LocalizationsDelegate<ModuleALocalizations> {
  const _ModuleALocalizationsDelegate();

  @override
  Future<ModuleALocalizations> load(Locale locale) {
    return SynchronousFuture<ModuleALocalizations>(lookupModuleALocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['bn', 'en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_ModuleALocalizationsDelegate old) => false;
}

ModuleALocalizations lookupModuleALocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'bn': return ModuleALocalizationsBn();
    case 'en': return ModuleALocalizationsEn();
    case 'es': return ModuleALocalizationsEs();
  }

  throw FlutterError(
    'ModuleALocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
