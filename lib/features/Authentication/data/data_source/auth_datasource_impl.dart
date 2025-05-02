import 'package:deco_trade_hub/features/Authentication/data/data_source/auth_datasource.dart';
import 'package:shared/shared.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthDataSourceImpl implements AuthDataSource {
  final SupabaseClient dbClient = Supabase.instance.client;

  @override
  Future<User> getCurrentUser() async {
    final response = dbClient.auth.currentUser!;
    return response;
  }

  @override
  Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) async {
    logE('email: $email, password: $password');
    final response = await dbClient.auth.signInWithPassword(
      email: email,
      password: password,
    );
    return response;
  }

  @override
  Future<AuthResponse> signUp({
    required String email,
    required String password,
    required String fullName,
    required String username,
    required String userRole,
  }) async {
    final response = await dbClient.auth.signUp(
      password: password,
      email: email,
      data: {
        'full_name': fullName,
        'username': username,
        'role': userRole,
      },
    );
    return response;
  }

  @override
  Future<void> signOut() async {
    final response = await dbClient.auth.signOut(
      scope: SignOutScope.global,
    );
    return response;
  }

  @override
  Future<AuthResponse> refreshSession({
    required String refreshToken,
  }) async {
    final authResponse = await dbClient.auth.refreshSession(
      refreshToken,
    );
    return authResponse;
  }
}
