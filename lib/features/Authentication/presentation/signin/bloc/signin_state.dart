part of 'signin_bloc.dart';

enum SignInStatus { initial, submitting, success, failure }

class SignInState extends Equatable {
  const SignInState({
    required this.email,
    required this.password,
    required this.status,
    required this.errorMessage,
  });

  const SignInState.initial()
      : email = '',
        password = '',
        errorMessage = '',
        status = SignInStatus.initial;

  SignInState copyWith({
    String? email,
    String? password,
    SignInStatus? status,
    String? errorMessage,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  final String email;

  final String password;

  final SignInStatus status;

  final String errorMessage;

  @override
  List<Object?> get props => [
        email,
        password,
        status,
        errorMessage,
      ];
}
