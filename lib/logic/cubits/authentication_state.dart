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

class Authenticated extends AuthenticationState {
  final User user;

  const Authenticated({this.user});

  @override
  List<Object> get props => [user];
}

class Unauthenticated extends AuthenticationState {
  final User user;

  const Unauthenticated({this.user});

  @override
  List<Object> get props => [user];
}

class Loading extends AuthenticationState {}
