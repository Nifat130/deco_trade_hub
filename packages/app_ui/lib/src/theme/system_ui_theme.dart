import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Theme for the [SystemUiOverlayStyle]
class SystemUiOverlayTheme {
  /// {@macro system_ui_overlay_theme}
  const SystemUiOverlayTheme();

  /// Defines iOS light SystemUiOverlayStyle.
  static const SystemUiOverlayStyle iOSLightSystemBarTheme =
      SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark,
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarIconBrightness: Brightness.dark,
  );

  /// Defines iOS dark SystemUiOverlayStyle.
  static const SystemUiOverlayStyle iOSDarkSystemBarTheme =
      SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  /// Defines Android light SystemUiOverlayStyle.
  static const SystemUiOverlayStyle androidLightSystemBarTheme =
      SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarIconBrightness: Brightness.dark,
  );

  /// Defines light SystemUiOverlayStyle.
  static const SystemUiOverlayStyle androidDarkSystemBarTheme =
      SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark,
    statusBarColor: Colors.black,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  /// Defines light SystemUiOverlayStyle.
  static const SystemUiOverlayStyle androidTransparentLightSystemBarTheme =
      SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  /// Defines light SystemUiOverlayStyle.
  static const SystemUiOverlayStyle androidTransparentDarkSystemBarTheme =
      SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark,
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarIconBrightness: Brightness.dark,
  );

  /// Defines adaptive iOS SystemUiOverlayStyle.
  static SystemUiOverlayStyle adaptiveOSSystemBarTheme({
    required bool light,
    required bool persistLight,
  }) {
    return light
        ? iOSLightSystemBarTheme
        : persistLight
            ? iOSLightSystemBarTheme
            : iOSDarkSystemBarTheme;
  }

  /// Defines adaptive Android SystemUiOverlayStyle.
  static SystemUiOverlayStyle adaptiveAndroidTransparentSystemBarTheme({
    required bool light,
    required bool persistLight,
  }) {
    return light
        ? androidTransparentLightSystemBarTheme
        : persistLight
            ? androidTransparentLightSystemBarTheme
            : androidTransparentDarkSystemBarTheme;
  }

  /// Defines a portrait only orientation for any device.
  static void setPortraitOrientation() {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );
  }
}
