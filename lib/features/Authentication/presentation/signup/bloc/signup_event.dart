part of 'signup_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();
}

class UserRoleChanged extends SignUpEvent {
  const UserRoleChanged(this.userRole);

  final String userRole;

  @override
  List<Object?> get props => [userRole];
}

class EmailChanged extends SignUpEvent {
  const EmailChanged(this.email);

  final String email;

  @override
  List<Object?> get props => [email];
}

class PasswordChanged extends SignUpEvent {
  const PasswordChanged(this.password);

  final String password;

  @override
  List<Object?> get props => [password];
}

class UsernameChanged extends SignUpEvent {
  const UsernameChanged(this.username);

  final String username;

  @override
  List<Object?> get props => [username];
}

class FullNameChanged extends SignUpEvent {
  const FullNameChanged(this.fullName);

  final String fullName;

  @override
  List<Object?> get props => [fullName];
}

class FormSubmitted extends SignUpEvent {
  @override
  List<Object?> get props => [];
}
