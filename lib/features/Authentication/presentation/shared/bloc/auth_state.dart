part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();
}

final class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

final class AuthLoading extends AuthState {
  @override
  List<Object> get props => [];
}

final class Authenticated extends AuthState {
  const Authenticated(this.user);

  final User user;

  @override
  List<Object> get props => [user];
}

final class UnAuthenticated extends AuthState {
  const UnAuthenticated(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
