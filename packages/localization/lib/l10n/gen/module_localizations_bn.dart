// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'module_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class ModuleALocalizationsBn extends ModuleALocalizations {
  ModuleALocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get noValueSelected => 'কোনো মান নির্বাচন করা হয়নি';

  @override
  String valueMustBeNumericLessThan(int max) {
    return 'মানটি সংখ্যা হতে হবে এবং $max অক্ষরের কম হতে হবে';
  }

  @override
  String valueMustBeNumericBetween(int min, int max) {
    return 'মানটি সংখ্যা হতে হবে এবং $min এবং $max অক্ষরের মধ্যে থাকতে হবে';
  }

  @override
  String get valueCannotBeEmpty => 'মানটি খালি থাকতে পারে না';

  @override
  String get valueMustBeNumeric => 'মানটি সংখ্যা হতে হবে';

  @override
  String valueMustBeNumericWithLength(int length) {
    return 'মানটি সংখ্যা হতে হবে এবং এর দৈর্ঘ্য $length অক্ষর হতে হবে';
  }

  @override
  String valueMustBeBetween(int min, int max) {
    return 'মানটি $min এবং $max অক্ষরের মধ্যে থাকতে হবে';
  }

  @override
  String get cancel => 'বাতিল';

  @override
  String get ok => 'ঠিক আছে';

  @override
  String get back => 'পেছনে';

  @override
  String get submit => 'জমা দিন';

  @override
  String get next => 'পরবর্তী';

  @override
  String get invalidEmailAddress => 'অবৈধ ইমেইল ঠিকানা';

  @override
  String get oopsAnErrorHasOccurred => 'অপস, একটি গুরুতর ত্রুটি ঘটেছে, দয়া করে সহায়তার জন্য যোগাযোগ করুন!';

  @override
  String get connected => 'সংযুক্ত';

  @override
  String get disconnected => 'অসংযুক্ত';

  @override
  String get networkErrorHasOccurred => 'একটি নেটওয়ার্ক ত্রুটি ঘটেছে';

  @override
  String get requestCancelled => 'অনুরোধ বাতিল করা হয়েছে';

  @override
  String get generalApiErrorMessage => 'একটি ত্রুটি ঘটেছে';
}
