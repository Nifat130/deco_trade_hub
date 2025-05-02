import 'package:app_ui/src/extensions/text_style_extension.dart';
import 'package:app_ui/src/styles/app_styles.dart';
import 'package:flutter/material.dart';

/// Provides values of current device screen `width` and `height` by provided
/// context.
extension BuildContextX on BuildContext {
  /// app localizations
  /// Defines current theme [Brightness].
  Brightness get brightness => theme.brightness;

  /// Whether current theme [Brightness] is light.
  bool get isLight => brightness == Brightness.light;

  /// Whether current theme [Brightness] is dark.
  bool get isDark => !isLight;

  /// Defines an adaptive [Color], depending on current theme brightness.
  Color get adaptiveColor =>
      isDark ? AppColorsTheme.white : AppColorsTheme.black;

  /// Defines a reversed adaptive [Color], depending on current theme
  /// brightness.
  Color get reversedAdaptiveColor =>
      isDark ? AppColorsTheme.black : AppColorsTheme.white;

  /// Defines a customizable adaptive [Color]. If [light] or [dark] is not
  /// provided default colors are used.
  Color customAdaptiveColor({Color? light, Color? dark}) =>
      isDark ? (light ?? AppColorsTheme.white) : (dark ?? AppColorsTheme.black);

  /// Defines a customizable reversed adaptive [Color]. If [light] or [dark]
  /// is not provided default reversed colors are used.
  Color customReversedAdaptiveColor({Color? light, Color? dark}) =>
      isDark ? (dark ?? AppColorsTheme.black) : (light ?? AppColorsTheme.white);

  /// Defines [MediaQueryData] based on provided context.
  Size get size => MediaQuery.sizeOf(this);

  /// Defines view insets from [MediaQuery] with current [BuildContext].
  EdgeInsets get viewInsets => MediaQuery.viewInsetsOf(this);

  /// Defines view padding of from [MediaQuery] with current [BuildContext].
  EdgeInsets get viewPadding => MediaQuery.viewPaddingOf(this);

  /// Defines value of device current width based on [size].
  double get screenWidth => size.width;

  /// Defines value of device current height based on [size].
  double get screenHeight => size.height;

  /// Defines value of current device pixel ratio.
  double get devicePixelRatio => MediaQuery.devicePixelRatioOf(this);

  /// Whether the current device is an `Android`.
  bool get isAndroid => theme.platform == TargetPlatform.android;

  /// Whether the current device is an `iOS`.
  bool get isIOS => !isAndroid;

  /// Whether the current device is a `mobile`.
  bool get isMobile => isAndroid || isIOS;

  /// base extensions
  /// Returns the theme extension of type [T] or null if not found.
  T? extensionOrNull<T>() => Theme.of(this).extension<T>();

  /// Returns the [AppButtonTheme] extension or null if not found.
  AppButtonTheme? get appButtonThemeOrNull =>
      Theme.of(this).extension<AppButtonTheme>();

  /// Returns the [AppColorsTheme] extension or null if not found.
  AppColorsTheme? get appColorsThemeOrNull =>
      Theme.of(this).extension<AppColorsTheme>();

  /// Returns the [AppDropdownMenuTheme] extension or null if not found.
  AppDropdownMenuTheme? get appDropdownMenuThemeOrNull =>
      Theme.of(this).extension<AppDropdownMenuTheme>();

  /// Returns the [AppTextFieldTheme] extension or null if not found.
  AppTextFieldTheme? get appTextFieldThemeOrNull =>
      Theme.of(this).extension<AppTextFieldTheme>();

  /// Returns the [AppTextTheme] extension or null if not found.
  AppTextTheme? get appTextThemeOrNull =>
      Theme.of(this).extension<AppTextTheme>();

  /// Returns the [AppTheme] extension or null if not found.
  AppTheme? get appThemeOrNull => Theme.of(this).extension<AppTheme>();

  /// Returns the theme extension of type [T].
  ///
  // ignore: lines_longer_than_80_chars
  /// {@template prime.template.theme_extension_must_not_be_null}
  /// The theme extension must be non-null.
  /// {@endtemplate}
  T extension<T>() => Theme.of(this).extension<T>()!;

  /// Returns the [AppButtonTheme] extension, guaranteed to be non-null.
  ///
  // ignore: lines_longer_than_80_chars
  /// {@macro prime.template.theme_extension_must_not_be_null}
  AppButtonTheme get appButtonTheme => extension<AppButtonTheme>();

  /// Returns the [AppColorsTheme] extension, guaranteed to be non-null.
  // ignore: lines_longer_than_80_chars
  /// {@macro prime.template.theme_extension_must_not_be_null}
  AppColorsTheme get appColorsTheme => extension<AppColorsTheme>();

  /// Returns the [AppDropdownMenuTheme] extension, guaranteed to be non-null.
  ///
  // ignore: lines_longer_than_80_chars
  /// {@macro prime.template.theme_extension_must_not_be_null}
  AppDropdownMenuTheme get appDropdownMenuTheme =>
      extension<AppDropdownMenuTheme>();

  /// Returns the [AppTextFieldTheme] extension, guaranteed to be non-null.
  ///
  // ignore: lines_longer_than_80_chars
  /// {@macro prime.template.theme_extension_must_not_be_null}
  AppTextFieldTheme get appTextFieldTheme => extension<AppTextFieldTheme>();

  /// Returns the [AppTextTheme] extension, guaranteed to be non-null.
  ///
  // ignore: lines_longer_than_80_chars
  /// {@macro prime.template.theme_extension_must_not_be_null}
  AppTextTheme get appTextTheme => extension<AppTextTheme>();

  /// Returns the [AppTheme] extension, guaranteed to be non-null.
  ///
  // ignore: lines_longer_than_80_chars
  /// {@macro prime.template.theme_extension_must_not_be_null}
  AppTheme get appTheme => extension<AppTheme>();
}
