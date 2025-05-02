import 'package:app_ui/app_ui.dart';
import 'package:deco_trade_hub/app/router/app_router.dart';
import 'package:deco_trade_hub/app/router/app_routes.dart';
import 'package:deco_trade_hub/app/view/global_keys.dart';
import 'package:deco_trade_hub/blocs/app_meta_data_cubit/app_meta_data_cubit.dart';
import 'package:deco_trade_hub/blocs/localization_cubit/localization_cubit.dart';
import 'package:deco_trade_hub/blocs/theme_cubit/theme_cubit.dart';
import 'package:deco_trade_hub/features/Authentication/data/data_source/auth_datasource_impl.dart';
import 'package:deco_trade_hub/features/Authentication/data/repository/auth_repo_impl.dart';
import 'package:deco_trade_hub/features/Authentication/presentation/shared/bloc/auth_cubit.dart';
import 'package:deco_trade_hub/services/dependencies/src/dependency_injection.dart';
import 'package:fconnectivity/fconnectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:localization/localization.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool _isFirstCapturedState = true;

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<LocalizationCubit>(
            create: (_) => ServiceProvider.get<LocalizationCubit>(),
          ),
          BlocProvider<ThemeCubit>(
            create: (_) => ServiceProvider.get<ThemeCubit>(),
          ),
          BlocProvider<AppMetaDataCubit>(
            create: (_) => ServiceProvider.get<AppMetaDataCubit>(),
          ),
          BlocProvider<AuthCubit>(
            create: (_) => AuthCubit(
              authRepo: AuthRepoImpl(authDataSource: AuthDataSourceImpl()),
            )..checkSession(),
          ),
        ],
        child: Builder(
          builder: (context) {
            final language = context.watch<LocalizationCubit>().state;
            final theme = context.watch<ThemeCubit>().state;

            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              getPages: appRoutes,
              initialRoute: AppRoutes.splash,
              theme: theme.themeData,
              builder: (context, child) {
                var result = child!;

                result = InternetAccessListener(
                  onInternetAccessGained: (BuildContext context) {
                    if (!_isFirstCapturedState) {
                      context.showSuccessSnackBar(text: 'Connected');
                    }
                    _isFirstCapturedState = false;
                  },
                  onInternetAccessLost: (BuildContext context) {
                    context.showErrorSnackBar(text: 'Disconnected');
                    _isFirstCapturedState = false;
                  },
                  child: result,
                );

                return Scaffold(
                  key: globalScaffoldKey,
                  resizeToAvoidBottomInset: false,
                  body: result,
                );
              },
              localizationsDelegates: ModuleALocalizations.localizationsDelegates,
              supportedLocales: ModuleALocalizations.supportedLocales,
              locale: Locale.fromSubtags(languageCode: language.code),
            );
          },
        ),
      );
}
