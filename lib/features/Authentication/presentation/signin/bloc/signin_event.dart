part of 'signin_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();
}

class EmailChanged extends SignInEvent {
  const EmailChanged({required this.email});

  final String email;

  @override
  List<Object> get props => [email];
}

class PasswordChanged extends SignInEvent {
  const PasswordChanged({required this.password});

  final String password;

  @override
  List<Object> get props => [password];
}

class LoginSubmitted extends SignInEvent {
  const LoginSubmitted();

  @override
  List<Object> get props => [];
}
