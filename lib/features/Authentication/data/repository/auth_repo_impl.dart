import 'package:deco_trade_hub/features/Authentication/data/data_source/auth_datasource.dart';
import 'package:deco_trade_hub/features/Authentication/domain/repository/auth_repo.dart';
import 'package:deco_trade_hub/features/store/model/store_model.dart';
import 'package:deco_trade_hub/services/dependencies/dependency_injection.dart';
import 'package:deco_trade_hub/services/global/enums.dart';
import 'package:deco_trade_hub/services/global/failures.dart';
import 'package:fpdart/fpdart.dart';
import 'package:persistent_storage/persistent_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepoImpl implements AuthRepo {
  const AuthRepoImpl({
    required AuthDataSource authDataSource,
  }) : _authDataSource = authDataSource;
  final AuthDataSource _authDataSource;

  @override
  Future<Either<Failure, User>> getCurrentUser() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _authDataSource.signIn(
        email: email,
        password: password,
      );

      final session = response.session;
      final user = response.user;

      if (session != null) {
        await _saveSession(session);
      }

      if (user != null) {
        return right(user);
      } else {
        return left(const Failure('User Not Found'));
      }
    } on AuthException catch (e) {
      return left(Failure(e.message));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<void> signOut() async {
    final storage = manualSl.get<PersistentStorage>();
    await storage.delete(key: StorageKeys.accessToken.keyString);
    await storage.delete(key: StorageKeys.refreshToken.keyString);

    return _authDataSource.signOut();
  }

  @override
  Future<Either<Failure, User>> signUp({
    required String email,
    required String password,
    required String fullName,
    required String username,
    required String userRole,
  }) async {
    try {
      final response = await _authDataSource.signUp(
        email: email,
        password: password,
        fullName: fullName,
        username: username,
        userRole: userRole,
      );

      final session = response.session;
      final user = response.user;

      if (session != null) {
        await _saveSession(session);
      }

      if (user != null) {
        return right(user);
      } else {
        return left(const Failure('Account is Not Created'));
      }
    } on AuthException catch (e) {
      return left(Failure(e.message));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> checkSession() async {
    try {
      final storage = manualSl.get<PersistentStorage>();

      final accessToken = await storage.read(
        key: StorageKeys.accessToken.keyString,
      );

      final refreshToken = await storage.read(
        key: StorageKeys.refreshToken.keyString,
      );

      if (accessToken != null && refreshToken != null) {
        final response = await _authDataSource.refreshSession(
          refreshToken: refreshToken,
        );

        final session = response.session;
        final user = response.user;

        if (session != null) {
          await _saveSession(session);
        }

        if (user != null) {
          return right(user);
        } else {
          return left(const Failure('User Not Found'));
        }
      } else {
        return left(const Failure('Session Not Found'));
      }
    } on AuthException catch (e) {
      return left(Failure(e.message));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Future<void> _saveSession(Session session) async {
    final storage = manualSl.get<PersistentStorage>();
    await storage.write(
      key: StorageKeys.accessToken.keyString,
      value: session.accessToken,
    );
    await storage.write(
      key: StorageKeys.refreshToken.keyString,
      value: session.refreshToken ?? '',
    );
  }

  @override
  Future<Either<Failure, StoreModel>> fetchStoreForUser(String userId) async {
    try {
      final response = await Supabase.instance.client.from('stores').select('id').eq('owner_id', userId).maybeSingle();

      if (response == null || response.isEmpty) {
        return left(Failure('No Store Found for The User'));
      }

      final store = StoreModel.fromJson(response);
      return right(store);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
