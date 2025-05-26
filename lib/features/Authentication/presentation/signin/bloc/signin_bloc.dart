import 'package:bloc/bloc.dart';
import 'package:deco_trade_hub/features/Authentication/domain/repository/auth_repo.dart';
import 'package:deco_trade_hub/features/Authentication/presentation/shared/bloc/auth_cubit.dart';
import 'package:equatable/equatable.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc({
    required AuthRepo authRepo,
    required AuthCubit authCubit,
  })  : _authRepo = authRepo,
        _authCubit = authCubit,
        super(const SignInState.initial()) {
    on<EmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email, status: SignInStatus.initial));
    });

    on<PasswordChanged>((event, emit) {
      emit(
        state.copyWith(password: event.password, status: SignInStatus.initial),
      );
    });

    on<LoginSubmitted>((event, emit) async {
      emit(state.copyWith(status: SignInStatus.submitting));

      try {
        final response = await _authRepo.signIn(
          email: state.email,
          password: state.password,
        );

        response.fold(
          (failure) {
            emit(
              state.copyWith(
                status: SignInStatus.failure,
                errorMessage: failure.message,
              ),
            );
          },
          (user) {
            _authCubit.checkSession();
            emit(state.copyWith(status: SignInStatus.success));
          },
        );
      } catch (e) {
        emit(
          state.copyWith(
            status: SignInStatus.failure,
            errorMessage: e.toString(),
          ),
        );
      }
    });
  }

  final AuthRepo _authRepo;
  final AuthCubit _authCubit;
}
