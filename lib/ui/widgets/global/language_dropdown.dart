import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:deco_trade_hub/blocs/localization_cubit/localization_cubit.dart';
import 'package:deco_trade_hub/blocs/theme_cubit/theme_cubit.dart';

class LanguageDropdown extends StatelessWidget {
  const LanguageDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizationCubit, Language>(
      builder: (context, selectedLanguage) {
        final isDarkMode = context.watch<ThemeCubit>().state is AppThemeDark;

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color:
                isDarkMode ? Colors.blueGrey.shade800 : Colors.blueGrey.shade50,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isDarkMode
                  ? Colors.blueGrey.shade600
                  : Colors.blueGrey.shade200,
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<Language>(
              isDense: true,
              value: selectedLanguage,
              icon: Icon(
                Icons.language,
                color: isDarkMode ? Colors.white70 : Colors.blueGrey.shade700,
                size: 20,
              ),
              style: TextStyle(
                color: isDarkMode ? Colors.white : Colors.black87,
                fontSize: 14,
              ),
              dropdownColor:
                  isDarkMode ? Colors.blueGrey.shade900 : Colors.white,
              items: Language.values.map((language) {
                return DropdownMenuItem<Language>(
                  alignment: Alignment.center,
                  value: language,
                  child: Text(language.displayName),
                );
              }).toList(),
              onChanged: (Language? newLanguage) {
                if (newLanguage != null) {
                  context.read<LocalizationCubit>().setLanguage(newLanguage);
                }
              },
            ),
          ),
        );
      },
    );
  }
}
