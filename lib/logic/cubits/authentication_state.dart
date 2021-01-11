part of 'authentication_cubit.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class Uninitialized extends AuthenticationState {}

class AuthError extends AuthenticationState {
  final String message;

  const AuthError(this.message);

  @override
  List<Object> get props => [message];
}

class Authenticated extends AuthenticationState {}

class Unauthenticated extends AuthenticationState {}

class Loading extends AuthenticationState {}
