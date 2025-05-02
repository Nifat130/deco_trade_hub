import 'package:gap/gap.dart';

/// Default Spacing in App UI.
abstract class AppSpacing {
  /// The default unit of spacing
  static const double spaceUnit = 16;

  /// xxxs spacing value (1pt)
  static const double xxxs = 0.0625 * spaceUnit;

  /// xxs spacing value (2pt)
  static const double xxs = 0.125 * spaceUnit;

  /// xs spacing value (4pt)
  static const double xs = 0.25 * spaceUnit;

  /// sm spacing value (8pt)
  static const double sm = 0.5 * spaceUnit;

  /// md spacing value (12pt)
  static const double md = 0.75 * spaceUnit;

  /// lg spacing value (16pt)
  static const double lg = spaceUnit;

  /// xlg spacing value (24pt)
  static const double xlg = 1.5 * spaceUnit;

  /// xxlg spacing value (40pt)
  static const double xxlg = 2.5 * spaceUnit;

  /// xxxlg pacing value (64pt)
  static const double xxxlg = 4 * spaceUnit;
}

/// Default Gap Spacing in App UI.
abstract class GapSpacing {
  const GapSpacing._();

  /// The default unit of spacing
  static Gap get spaceUnit => const Gap(AppSpacing.spaceUnit);

  /// xxxs spacing value (1pt)
  static Gap get xxxs => const Gap(AppSpacing.xxxs);

  /// xxs spacing value (2pt)
  static Gap get xxs => const Gap(AppSpacing.xxs);

  /// xs spacing value (4pt)
  static Gap get xs => const Gap(AppSpacing.xs);

  /// sm spacing value (8pt)
  static Gap get sm => const Gap(AppSpacing.sm);

  /// md spacing value (12pt)
  static Gap get md => const Gap(AppSpacing.md);

  /// lg spacing value (16pt)
  static Gap get lg => const Gap(AppSpacing.lg);

  /// xlg spacing value (24pt)
  static Gap get xlg => const Gap(AppSpacing.xlg);

  /// xxlg spacing value (40pt)
  static Gap get xxlg => const Gap(AppSpacing.xxlg);

  /// xxxlg pacing value (64pt)
  static Gap get xxxlg => const Gap(AppSpacing.xxxlg);
}
