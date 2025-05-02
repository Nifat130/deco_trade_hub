import 'package:app_ui/app_ui.dart';
import 'package:deco_trade_hub/blocs/bloc_utils/src/base_hydrated_cubit.dart';
import 'package:deco_trade_hub/services/dependencies/src/dependency_injection.dart';

/// Manages the theme of the app.
@LazySingletonService()
class ThemeCubit extends BaseHydratedCubit<AppTheme> {
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
