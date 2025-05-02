import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:deco_trade_hub/blocs/localization_cubit/localization_cubit.dart';

class LanguageDropdown2 extends StatelessWidget {
  const LanguageDropdown2({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizationCubit, Language>(
      builder: (context, selectedLanguage) {
        return DropdownButtonHideUnderline(
          child: BaseDropdownButton<Language>(
            width: context.screenWidth * 0.5,
            height: 40,
            value: selectedLanguage,
            items: Language.values,
            onChanged: (Language? newLanguage) {
              if (newLanguage != null) {
                context.read<LocalizationCubit>().setLanguage(newLanguage);
              }
            },
            itemBuilder: (context, item) => Text(
              item.displayName,
              style: context.appTextTheme.body4,
            ),
          ),
        );
      },
    );
  }
}
