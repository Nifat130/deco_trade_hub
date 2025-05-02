import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

/// A custom button widget with a filled background.
///
/// This button extends [BaseElevatedButton] with predefined styling for a
/// filled button.
class BaseFilledButton extends StatelessWidget {
  /// Creates a [BaseFilledButton].
  ///
  /// The [text], [onPressed], and [backgroundColor] are required parameters.
  const BaseFilledButton({
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    super.key,
    this.width,
    this.textAlign,
    this.overflow,
    this.textColor = AppColorsTheme.white,
  });

  /// The text displayed on the button.
  final String text;

  /// The button's width. If null, it sizes to fit its content.
  final double? width;

  /// Callback invoked when the button is tapped.
  final VoidCallback? onPressed;

  /// Horizontal text alignment.
  final TextAlign? textAlign;

  /// Visual overflow handling.
  final TextOverflow? overflow;

  /// The button's background color.
  final Color backgroundColor;

  /// The button text color. Defaults to white.
  final Color textColor;

  bool get _isDisabled => onPressed == null;

  @override
  Widget build(BuildContext context) => BaseElevatedButton(
        backgroundColor: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.disabled)) {
              return context.appColorsTheme.disabledButtonBackgroundColor;
            }
            return backgroundColor;
          },
        ),
        side: const WidgetStatePropertyAll(BorderSide.none),
        width: width,
        text: text,
        textStyle: context.appTextTheme.body3.copyWith(
          color: _isDisabled
              ? context.appColorsTheme.onDisabledButtonBackgroundColor
              : textColor,
          fontWeight: FontWeight.bold,
        ),
        textAlign: textAlign,
        overflow: overflow,
        onPressed: onPressed,
      );
}
