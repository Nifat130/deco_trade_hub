import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:deco_trade_hub/blocs/theme_cubit/theme_cubit.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, AppTheme>(
      builder: (context, state) {
        final isDarkMode = state is AppThemeDark;

        return GestureDetector(
          onTap: () {
            context.read<ThemeCubit>().setTheme(
                  isDarkMode ? AppThemeLight.instance : AppThemeDark.instance,
                );
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(4),
            width: 55,
            height: 30,
            decoration: BoxDecoration(
              color: isDarkMode
                  ? Colors.blueGrey.shade800
                  : Colors.blueGrey.shade100,
              borderRadius: BorderRadius.circular(20),
            ),
            child: AnimatedAlign(
              duration: const Duration(milliseconds: 200),
              alignment:
                  isDarkMode ? Alignment.centerRight : Alignment.centerLeft,
              child: Icon(
                isDarkMode ? Icons.dark_mode : Icons.light_mode,
                color:
                    isDarkMode ? Colors.amber.shade300 : Colors.orange.shade800,
                size: 16,
              ),
            ),
          ),
        );
      },
    );
  }
}
