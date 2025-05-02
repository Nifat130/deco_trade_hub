import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  const Failure([this.message = 'An unexpected error occurred,']);

  final String message;

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure([super.message]);
}
