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

class Unauthenticated extends AuthenticationState {
  final User user;

  /* This is an empty user, or a user that haven't completed registration fully
   *
   */
  const Unauthenticated({this.user});

  @override
  List<Object> get props => [user];
}

class Loading extends AuthenticationState {}
