import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthDataSource {
  Future<AuthResponse> signIn({
    required String email,
    required String password,
  });

  Future<AuthResponse> signUp({
    required String email,
    required String password,
    required String fullName,
    required String username,
    required String userRole,
  });

  Future<void> signOut();

  Future<User> getCurrentUser();

  Future<AuthResponse> refreshSession({
    required String refreshToken,
  });
}
