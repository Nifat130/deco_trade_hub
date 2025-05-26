import 'package:deco_trade_hub/features/store/model/store_model.dart';
import 'package:deco_trade_hub/services/global/failures.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRepo {
  Future<Either<Failure, User>> signIn({
    required String email,
    required String password,
  });

  Future<Either<Failure, User>> signUp({
    required String email,
    required String password,
    required String fullName,
    required String username,
    required String userRole,
  });

  Future<void> signOut();

  Future<Either<Failure, User>> getCurrentUser();

  Future<Either<Failure, User>> checkSession();

  Future<Either<Failure, StoreModel>> fetchStoreForUser(String userId);
}
