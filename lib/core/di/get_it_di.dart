import 'package:get_it/get_it.dart';
import 'package:persistent_storage/persistent_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final manualSl = GetIt.instance;

class ServiceProvider {
  static Future<void> init() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    // final apiFromDotenv = AppSecrets.supabaseAnonKey;
    // final urlFromDotenv = AppSecrets.supabaseUrl;

    manualSl
      ..registerLazySingleton<PersistentStorage>(
        () => PersistentStorage(
          sharedPreferences: sharedPreferences,
        ),
      )
      ..registerLazySingleton<SupabaseClient>(
        () => Supabase.instance.client,
      );
  }
}
