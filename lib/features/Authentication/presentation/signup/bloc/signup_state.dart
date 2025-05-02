part of 'signup_bloc.dart';

enum SignUpStatus { initial, submitting, success, failure }

class SignUpState extends Equatable {
  const SignUpState({
    required this.email,
    required this.fullName,
    required this.password,
    required this.username,
    required this.userRole,
    this.status = SignUpStatus.initial,
    this.errorMessage = '',
  });

  // factory SignUpState.initial() {
  //   return const SignUpState(
  //     email: '',
  //     password: '',
  //     username: '',
  //     fullName: '',
  //     userRole: 'Retailer',
  //   );
  // }

  const SignUpState.initial()
      : email = '',
        password = '',
        username = '',
        fullName = '',
        userRole = '',
        status = SignUpStatus.initial,
        errorMessage = '';

  final String email;
  final String password;
  final String username;
  final String fullName;
  final String userRole;
  final SignUpStatus status;
  final String errorMessage;

  SignUpState copyWith({
    String? email,
    String? password,
    String? username,
    String? fullName,
    String? userRole,
    SignUpStatus? status,
    String? errorMessage,
  }) {
    return SignUpState(
      email: email ?? this.email,
      password: password ?? this.password,
      fullName: fullName ?? this.fullName,
      username: username ?? this.username,
      userRole: userRole ?? this.userRole,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        email,
        password,
        username,
        fullName,
        userRole,
        status,
        errorMessage,
      ];
}
