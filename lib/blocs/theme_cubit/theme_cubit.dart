import 'package:app_ui/app_ui.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

/// Manages the theme of the app.

class ThemeCubit extends HydratedCubit<AppTheme> {
  // initially the theme is set to light theme
  ThemeCubit() : super(AppThemeLight.instance);

  /// Sets the theme to the given theme.
  void setTheme(AppTheme theme) => emit(theme);

  @override
  AppTheme? fromJson(Map<String, dynamic> json) => switch (json['theme']) {
        'light' => AppThemeLight.instance,
        'dark' => AppThemeDark.instance,
        // fallback to light theme if an unknown theme is saved
        _ => AppThemeLight.instance,
      };

  @override
  Map<String, dynamic>? toJson(AppTheme state) => {
        'theme': switch (state) {
          AppThemeLight() => 'light',
          AppThemeDark() => 'dark',
        },
      };
}
