import 'dart:async';
import 'dart:developer';

import 'package:deco_trade_hub/app/app_secret.dart';
import 'package:deco_trade_hub/app/view/app.dart';
import 'package:deco_trade_hub/services/dependencies/src/dependency_injection.dart';
import 'package:deco_trade_hub/services/environments/environments.dart';
import 'package:deco_trade_hub/services/logger/error_logger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared/shared.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/di/file_container.dart';
import 'core/logger/app_bloc_observer.dart';

Future<void> bootstrap(Environment env) async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  /// GetX dependency injection
  AppBindings().dependencies();

  await AppSecrets.load();
  await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnonKey,
  );
  Stripe.publishableKey = AppSecrets.stripePublishableKey;
  Stripe.instance.applySettings();

  await ManualServiceProvider.init();

  await ServiceProvider.init(environment: env);

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory:
        kIsWeb ? HydratedStorageDirectory.web : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );

  ServiceProvider.get<ErrorLogger>().registerErrorHandlers();
  FlutterError.onError = (details) {
    logF(details.exceptionAsString(), stackTrace: details.stack);
  };

  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    log(record.message, name: '${record.level.name}: ${record.time}');
  });
  Bloc.observer = const AppBlocObserver();

  runApp(const App());
}
