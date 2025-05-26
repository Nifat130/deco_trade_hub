import 'package:bloc/bloc.dart';
import 'package:deco_trade_hub/features/Authentication/domain/repository/auth_repo.dart';
import 'package:deco_trade_hub/features/store/model/store_model.dart';
import 'package:equatable/equatable.dart';
import 'package:shared/shared.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required AuthRepo authRepo,
  })  : _authRepo = authRepo,
        super(AuthInitial());
  final AuthRepo _authRepo;

  Future<void> checkSession() async {
    emit(AuthLoading());
    try {
      final response = await _authRepo.checkSession();

      await response.fold(
        (l) async => emit(UnAuthenticated(l.message)),
        (user) async {
          final storeResult = await _authRepo.fetchStoreForUser(user.id); // Add this method in your AuthRepo
          storeResult.fold(
            /// User is authenticated but has no store
            (l) => emit(AuthenticatedWithoutStore(user)),

            /// User is authenticated and has a store
            (store) => emit(AuthenticatedWithStore(user, store)),
          );
        },
      );
    } catch (e) {
      logE(e.toString());
      emit(UnAuthenticated(e.toString()));
    }
  }

  Future<void> signOut() async {
    emit(AuthLoading());
    try {
      await _authRepo.signOut();
      emit(const UnAuthenticated('Logged out Successfully'));
    } catch (e) {
      logE(e.toString());
      emit(UnAuthenticated(e.toString()));
    }
  }
}
