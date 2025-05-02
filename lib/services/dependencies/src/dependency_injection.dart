import 'dart:async';

import 'package:deco_trade_hub/app/app_secret.dart';
import 'package:deco_trade_hub/services/dependencies/src/dependency_injection.config.dart';
import 'package:deco_trade_hub/services/dependencies/src/dependency_injection_instance_names.dart';
import 'package:deco_trade_hub/services/environments/environments.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart' hide Environment;
import 'package:persistent_storage/persistent_storage.dart';
import 'package:shared/shared.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// Typedefs for injectable's annotations to hide the package from
// the application code, so that it can be replaced with another DI package
// if needed.
/// Annotation for classes that should be registered as services and available
/// via the dependency injection container.
typedef Service = Injectable;

/// Annotation for classes that should be registered as singleton services and
/// available via the dependency injection container.
typedef SingletonService = Singleton;

/// Annotation for classes that should be registered as lazy singleton services
/// and available via the dependency injection container.
typedef LazySingletonService = LazySingleton;

/// Initializes the dependency container.
@InjectableInit(
  initializerName: r'$initInjectable',
  asExtension: false,
)
Future<void> _initInjectable(
  GetIt getIt, {
  required Environment environment,
}) async =>
    $initInjectable(
      getIt,
      environment: environment.name,
    );

/// The ServiceProvider class encapsulates the dependency injection logic
/// and provides access to the services that are registered in the container.
class ServiceProvider {
  static final GetIt _getIt = GetIt.instance;

  static Completer<void>? _initializedCompleter;

  /// Initializes the dependency container.
  static Future<void> init({
    required Environment environment,
  }) async {
    if (_initializedCompleter != null) return _initializedCompleter!.future;
    _initializedCompleter = Completer<void>();
    unawaited(_init(environment: environment));
    return _initializedCompleter!.future;
  }

  static Future<void> _init({required Environment environment}) async {
    _getIt.registerLazySingleton<Environment>(() => environment);

    await _initInjectable(
      _getIt,
      environment: environment,
    );
    _initializedCompleter!.complete();
  }

  /// Retrieves a registered instance of type [T] from the dependency container.
  /// - [instanceName]: The name of the instance to retrieve.
  /// - [param1]: The first parameter to pass to the instance's constructor.
  /// - [param2]: The second parameter to pass to the instance's constructor.
  static T get<T extends Object>({
    String? instanceName,
    dynamic param1,
    dynamic param2,
  }) =>
      _getIt.get<T>(
        instanceName: instanceName,
        param1: param1,
        param2: param2,
      );

  static Future<T> getAsync<T extends Object>({
    String? instanceName,
    dynamic param1,
    dynamic param2,
  }) =>
      _getIt.getAsync<T>(
        instanceName: instanceName,
        param1: param1,
        param2: param2,
      );
}

/// Used to manually register services in the dependency container that are not
/// registered otherwise by annotations.
@module
abstract class RegisterModule {
  @Named(DependencyInjectionInstances.incrementValue)
  int get incrementValue => 1;
}

final manualSl = GetIt.instance;

class ManualServiceProvider {
  static Future<void> init() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final apiFromDotenv = AppSecrets.supabaseAnonKey;
    final urlFromDotenv = AppSecrets.supabaseUrl;

    manualSl
      ..registerLazySingleton<PersistentStorage>(
        () => PersistentStorage(
          sharedPreferences: sharedPreferences,
        ),
      )
      ..registerLazySingleton<SupabaseClient>(
        () => Supabase.instance.client,
      )
      ..registerLazySingleton(
        () => RestClient(apiKey: apiFromDotenv, baseUrl: urlFromDotenv),
      );
  }
}
