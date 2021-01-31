import 'package:avs/data/models/tokens.dart';
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
  //BehaviorSubject
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

  set userAddress(Address address) {
    _user = _user.copyWith(address: address);
  }

  set tokens(Tokens tokens) {
    _user = _user.copyWith(tokens: tokens);
  }

  set freshUser(User user) {
    this._user = user;
  }

  void _initAuth() {
    //userRepository.hasToken()

    _userRepository.getUser().then((user) {
      if (skipAuthentication) {
        emit(Authenticated(user: User.test));
      } else {
        // print(user.isFullyRegistered);
        if (user != null) {
          this._user = user;
          // TODO: Check if the user gotten has completed registration
          if (user.isFullyRegistered) {
            emit(Authenticated(user: user));
          } else {
            emit(Unauthenticated(user: user));
          }
        } else {
          this._user = User.test;
          emit(Unauthenticated(user: _user));
          print('unauth');
        }
      }
    }).catchError((error) {
      print(error);
      emit(AuthError(Error.safeToString(error)));
    });
  }

  Future<bool> refreshTokens() async {
    final tokens = await _userRepository.refreshTokens(user.tokens);
    print('This is token $tokens');
    if (tokens != null) {
      _user = user.copyWith(tokens: tokens);
      await _userRepository.logUserOut();
      await _userRepository.setUser(user: user);
      return true;
    } else {
      print("Couldn't refresh token");
      await _userRepository.logUserOut();
      emit(Unauthenticated());
      return false;
    }

    // tokens == null
    //     ? emit(Unauthenticated())
    //     : _user = user.copyWith(tokens: tokens);
    // await _userRepository.setUser(user: user);
  }

  Future<void> logUserOut() async {
    await _userRepository.logUserOut();
    emit(Unauthenticated());
  }

  void skipRegistration() {}
}
