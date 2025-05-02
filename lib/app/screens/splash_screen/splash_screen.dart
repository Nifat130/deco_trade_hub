import 'package:app_ui/app_ui.dart';
import 'package:deco_trade_hub/blocs/app_meta_data_cubit/app_meta_data_cubit.dart';
import 'package:deco_trade_hub/services/dependencies/src/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../router/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const routeName = 'splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    ServiceProvider.get<AppMetaDataCubit>().init();
  }

  @override
  Widget build(BuildContext context) => BlocConsumer<AppMetaDataCubit, AppMetaDataState>(
        listener: (context, appMetaDataState) {
          switch (appMetaDataState) {
            case AppMetaDataInitial():
            case AppMetaDataLoading():
            case AppMetaDataLoaded():
              if (appMetaDataState.isFirstTimer == 'false') {
                Get.toNamed(AppRoutes.rolePrompt);
              } else {
                Get.toNamed(AppRoutes.onboarding);
              }
            case AppMetaDataLoadingFailed():
              Get.toNamed(AppRoutes.error);
          }
        },
        builder: (context, appMetaDataState) {
          return BaseScreenWidget(
            loading: true,
            body: Center(
              child: SvgPicture.asset(
                'assets/svg/splash_deco_trade_hub.svg',
                width: 300,
                height: 300,
              ),
            ),
          );
        },
      );
}
