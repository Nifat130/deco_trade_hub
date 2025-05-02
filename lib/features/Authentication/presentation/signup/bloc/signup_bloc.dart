// sign_up_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:deco_trade_hub/features/Authentication/domain/repository/auth_repo.dart';
import 'package:deco_trade_hub/features/Authentication/presentation/shared/bloc/auth_cubit.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc({
    required AuthCubit authCubit,
    required AuthRepo authRepo,
  })  : _authRepo = authRepo,
        _authCubit = authCubit,
        super(const SignUpState.initial()) {
    on<UserRoleChanged>((event, emit) {
      emit(
        state.copyWith(userRole: event.userRole, status: SignUpStatus.initial),
      );
    });

    on<EmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email, status: SignUpStatus.initial));
    });

    on<PasswordChanged>((event, emit) {
      emit(
        state.copyWith(password: event.password, status: SignUpStatus.initial),
      );
    });

    on<UsernameChanged>((event, emit) {
      emit(
        state.copyWith(username: event.username, status: SignUpStatus.initial),
      );
    });

    on<FullNameChanged>((event, emit) {
      emit(
        state.copyWith(fullName: event.fullName, status: SignUpStatus.initial),
      );
    });

    on<FormSubmitted>((event, emit) async {
      emit(state.copyWith(status: SignUpStatus.submitting));

      try {
        final response = await _authRepo.signUp(
          email: state.email,
          password: state.password,
          username: state.username,
          fullName: state.fullName,
          userRole: state.userRole,
        );

        response.fold(
          (error) {
            emit(
              state.copyWith(
                status: SignUpStatus.failure,
                errorMessage: error.message,
              ),
            );
          },
          (user) {
            _authCubit.emit(Authenticated(user));
            emit(state.copyWith(status: SignUpStatus.success));
          },
        );
      } catch (e) {
        emit(
          state.copyWith(
            status: SignUpStatus.failure,
            errorMessage: e.toString(),
          ),
        );
        return;
      }

      // Call the signup method from the authDataSource
    });
  }

  final AuthRepo _authRepo;
  final AuthCubit _authCubit;
}
