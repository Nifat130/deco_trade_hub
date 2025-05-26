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

final class AuthenticatedWithoutStore extends AuthState {
  const AuthenticatedWithoutStore(this.user);

  final User user;

  @override
  List<Object> get props => [user];
}

final class AuthenticatedWithStore extends AuthState {
  const AuthenticatedWithStore(this.user, this.store);

  final User user;
  final StoreModel store;

  @override
  List<Object> get props => [user, store];
}

final class UnAuthenticated extends AuthState {
  const UnAuthenticated(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
