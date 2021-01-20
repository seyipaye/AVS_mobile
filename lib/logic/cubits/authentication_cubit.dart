import 'package:avs/data/models/user.dart';
import 'package:avs/data/repositories/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'authentication_state.dart';

// TODO: Check for normal functionality
final skipAuthentication = false;

/*
primary-agent@quickavs.ng
System123!
 */
class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit({@required UserRepository userRepository})
      : _userRepository = userRepository,
        super(Uninitialized()) {
    _initAuth();
  }

  User _user;
  final UserRepository _userRepository;

  User get user => _user;

  set authId(String id) {
    _user = _user.copyWith(id: id);
  }

  void setUserInfo(
      {String firstName,
      String lastName,
      String otherName,
      String gender,
      String email}) {
    _user = _user.copyWith(
      firstName: firstName,
      lastName: lastName,
      otherName: otherName,
      email: UserEmail(address: email),
      gender: gender,
    );
  }

  set mobile(String mobile) {
    _user = User(mobile: mobile);
  }

  set authenticatedUser(User user) {
    _user = user;
    emit(Authenticated(user: _user));
  }

  void _initAuth() {
    //userRepository.hasToken()

    _userRepository.getUser().then((user) {
      if (skipAuthentication) {
        emit(Authenticated(user: User.test));
      } else {
        if (user != null) {
          this._user = user;
          // TODO: Check if the user gotten has completed registration
          if (user.isFullyRegistered) {
            emit(Authenticated(user: user));
          } else {
            emit(Unauthenticated(user: user));
          }
        } else {
          emit(Unauthenticated());
        }
      }
    }).catchError((error) {
      emit(AuthError(Error.safeToString(error)));
    });

    /*final bool hasToken = await

    if (hasToken) {
      yield AuthenticationAuthenticated();
    } else {
      yield AuthenticationUnauthenticated();
    }*/
  }
}
