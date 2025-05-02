import 'package:app_ui/src/styles/app_styles.dart';
import 'package:flutter/material.dart';

//ignore_for_file: public_member_api_docs
sealed class AppTheme {
  const AppTheme();

  ThemeData get themeData;
}

class AppThemeLight extends AppTheme {
  const AppThemeLight._();

  static const AppThemeLight instance = AppThemeLight._();

  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        colorScheme: _lightColorScheme(),
        textSelectionTheme: _lightTextSelectionThemeData(),
        checkboxTheme: _lightCheckboxThemeData(),
        dividerTheme: _lightDividerThemeData(),
        progressIndicatorTheme: _lightProgressIndicatorThemeData(),
        scrollbarTheme: _lightScrollbarThemeData(),
        extensions: [
          AppTextThemeLight.instance,
          AppTextFieldThemeLight.instance,
          AppButtonThemeLight.instance,
          AppDropdownMenuThemeLight.instance,
          AppColorsThemeLight.instance,
        ],
      );

  ScrollbarThemeData _lightScrollbarThemeData() => const ScrollbarThemeData(
        thickness: WidgetStatePropertyAll(10),
        radius: Radius.circular(20),
      );

  DividerThemeData _lightDividerThemeData() => DividerThemeData(
        thickness: 1,
        color: AppColorsThemeLight.instance.dividerColor,
      );

  ColorScheme _lightColorScheme() => ColorScheme.fromSeed(
        seedColor: AppColorsThemeLight.instance.primaryColor,
        primary: AppColorsThemeLight.instance.primaryColor,
        secondary: AppColorsThemeLight.instance.secondaryColor,
        onPrimary: AppColorsThemeLight.instance.onPrimary,
        onSecondary: AppColorsThemeLight.instance.onSecondary,
        surface: AppColorsThemeLight.instance.background,
      );

  TextSelectionThemeData _lightTextSelectionThemeData() =>
      TextSelectionThemeData(
        cursorColor: AppColorsThemeLight.instance.cursorColor,
        selectionHandleColor: AppColorsThemeLight.instance.selectionHandleColor,
        selectionColor: AppColorsThemeLight.instance.selectionColor,
      );

  CheckboxThemeData _lightCheckboxThemeData() => CheckboxThemeData(
        checkColor: WidgetStateProperty.all(
          AppColorsThemeLight.instance.checkboxCheckColor,
        ),
        fillColor: WidgetStateProperty.resolveWith(
          (states) {
            Color? color;
            if (states.contains(WidgetState.disabled)) {
              color = AppColorsThemeLight.instance.disabledCheckboxFillColor;
            } else if (states.contains(WidgetState.selected)) {
              color = AppColorsThemeLight.instance.selectedCheckboxFillColor;
            } else if (!states.contains(WidgetState.selected)) {
              color = AppColorsThemeLight.instance.unSelectedCheckboxFillColor;
            }
            return color;
          },
        ),
        side: WidgetStateBorderSide.resolveWith(
          (states) {
            BorderSide? borderSide;
            const width = 1.5;
            if (states.contains(WidgetState.disabled)) {
              borderSide = BorderSide(
                color: AppColorsThemeLight.instance.disabledBorderColor,
                width: width,
              );
            } else if (states.contains(WidgetState.selected)) {
              borderSide = BorderSide(
                color: AppColorsThemeLight.instance.focusedBorderColor,
                width: width,
              );
            } else if (!states.contains(WidgetState.selected)) {
              borderSide = BorderSide(
                color: AppColorsThemeLight.instance.enabledBorderColor,
                width: width,
              );
            }
            return borderSide;
          },
        ),
      );

  ProgressIndicatorThemeData _lightProgressIndicatorThemeData() =>
      ProgressIndicatorThemeData(
        color: AppColorsThemeLight.instance.progressIndicatorColor,
      );
}

class AppThemeDark extends AppTheme {
  const AppThemeDark._();

  static const AppThemeDark instance = AppThemeDark._();

  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        colorScheme: _darkColorScheme(),
        textSelectionTheme: _darkTextSelectionThemeData(),
        checkboxTheme: _darkCheckboxThemeData(),
        dividerTheme: _darkDividerThemeData(),
        progressIndicatorTheme: _darkProgressIndicatorThemeData(),
        scrollbarTheme: _darkScrollbarThemeData(),
        extensions: [
          AppTextThemeDark.instance,
          AppTextFieldThemeDark.instance,
          AppButtonThemeDark.instance,
          AppDropdownMenuThemeDark.instance,
          AppColorsThemeDark.instance,
        ],
      );

  ScrollbarThemeData _darkScrollbarThemeData() => const ScrollbarThemeData(
        thickness: WidgetStatePropertyAll(10),
        radius: Radius.circular(20),
      );

  DividerThemeData _darkDividerThemeData() => DividerThemeData(
        thickness: 1,
        color: AppColorsThemeDark.instance.dividerColor,
      );

  ColorScheme _darkColorScheme() => ColorScheme.fromSeed(
        seedColor: AppColorsThemeDark.instance.primaryColor,
        primary: AppColorsThemeDark.instance.primaryColor,
        secondary: AppColorsThemeDark.instance.secondaryColor,
        onPrimary: AppColorsThemeDark.instance.onPrimary,
        onSecondary: AppColorsThemeDark.instance.onSecondary,
        surface: AppColorsThemeDark.instance.background,
      );

  TextSelectionThemeData _darkTextSelectionThemeData() =>
      TextSelectionThemeData(
        cursorColor: AppColorsThemeDark.instance.cursorColor,
        selectionHandleColor: AppColorsThemeDark.instance.selectionHandleColor,
        selectionColor: AppColorsThemeDark.instance.selectionColor,
      );

  CheckboxThemeData _darkCheckboxThemeData() => CheckboxThemeData(
        checkColor: WidgetStateProperty.all(
          AppColorsThemeDark.instance.checkboxCheckColor,
        ),
        fillColor: WidgetStateProperty.resolveWith(
          (states) {
            Color? color;
            if (states.contains(WidgetState.disabled)) {
              color = AppColorsThemeDark.instance.disabledCheckboxFillColor;
            } else if (states.contains(WidgetState.selected)) {
              color = AppColorsThemeDark.instance.selectedCheckboxFillColor;
            } else if (!states.contains(WidgetState.selected)) {
              color = AppColorsThemeDark.instance.unSelectedCheckboxFillColor;
            }
            return color;
          },
        ),
        side: WidgetStateBorderSide.resolveWith(
          (states) {
            BorderSide? borderSide;
            const width = 1.5;
            if (states.contains(WidgetState.disabled)) {
              borderSide = BorderSide(
                color: AppColorsThemeDark.instance.disabledBorderColor,
                width: width,
              );
            } else if (states.contains(WidgetState.selected)) {
              borderSide = BorderSide(
                color: AppColorsThemeDark.instance.focusedBorderColor,
                width: width,
              );
            } else if (!states.contains(WidgetState.selected)) {
              borderSide = BorderSide(
                color: AppColorsThemeDark.instance.enabledBorderColor,
                width: width,
              );
            }
            return borderSide;
          },
        ),
      );

  ProgressIndicatorThemeData _darkProgressIndicatorThemeData() =>
      ProgressIndicatorThemeData(
        color: AppColorsThemeDark.instance.progressIndicatorColor,
      );
}
