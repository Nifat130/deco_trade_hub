import 'package:app_ui/app_ui.dart';
import 'package:deco_trade_hub/app/screens/home_screen/src/cubit/counter_cubit.dart';
import 'package:deco_trade_hub/features/Authentication/presentation/shared/bloc/auth_cubit.dart';
import 'package:deco_trade_hub/services/dependencies/src/dependency_injection.dart';
import 'package:deco_trade_hub/ui/widgets/global/base_language_dropdown.dart';
import 'package:deco_trade_hub/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:localization/localization.dart';

import '../../../../router/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = 'home_screen';

  @override
  Widget build(BuildContext context) => BlocProvider<CounterCubit>(
        create: (context) => ServiceProvider.get(),
        child: Builder(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: Text('Home Screen', style: context.appTextTheme.body1),
              centerTitle: true,
              elevation: 10,
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const ThemeSwitch(),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: BlocBuilder<CounterCubit, int>(
                      builder: (context, counterState) {
                        return Text(
                          'Counter value: $counterState',
                          style: context.appTextTheme.body2,
                          textAlign: TextAlign.center,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  // const DecoTradeHubSplashLogo(),
                  const SizedBox(height: 10),
                  BaseFilledButton(
                    text: 'Press Here',
                    onPressed: () async {},
                    backgroundColor: AppColorsTheme.green,
                  ),
                  const SizedBox(height: 10),
                  BaseFilledButton(
                    text: 'Increment',
                    onPressed: context.read<CounterCubit>().increment,
                    backgroundColor: AppColorsTheme.green,
                  ),
                  const SizedBox(height: 10),
                  ShallowButton(
                    color: AppColorsTheme.gold,
                    text: 'Decrement',
                    onPressed: context.read<CounterCubit>().decrement,
                  ),
                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      if (state is Authenticated) {
                        final userMetaData = state.user.userMetadata;

                        final name = userMetaData?['role'];
                        return Column(
                          children: [
                            Text(
                              'User: ${state.user.userMetadata}'
                              'Name: $name',
                              style: context.appTextTheme.body6,
                            ),
                          ],
                        );
                      }

                      return const SizedBox();
                    },
                  ),
                  const SizedBox(height: 10),
                  Text(
                    context.appLocalizations.connected,
                    style: context.appTextTheme.title4,
                  ),
                  const SizedBox(height: 10),
                  const LanguageDropdown(),
                  const SizedBox(height: 10),
                  const LanguageDropdown2(),
                  const SizedBox(height: 10),
                  const SignOutButton(),
                ],
              ),
            ),
          ),
        ),
      );
}

class SignOutButton extends StatelessWidget {
  const SignOutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          Get.offAllNamed(AppRoutes.signIn);
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const CircularProgressIndicator();
        }
        return FilledButton.icon(
          label: const Text('Log Out'),
          onPressed: () {
            context.read<AuthCubit>().signOut();
          },
          icon: const Icon(Icons.logout),
        );
      },
    );
  }
}
