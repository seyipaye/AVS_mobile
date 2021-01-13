import 'package:avs/data/models/user.dart';
import 'package:avs/data/repositories/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit({@required UserRepository userRepository})
      : _userRepository = userRepository,
        super(Uninitialized()) {
    //userRepository.hasToken()

    userRepository.getUser().then((user) {
/*
      emit(Authenticated(user: User.test)); return; // TODO: Remove for normal functionality
*/

      if (user != null) {
        this.user = user;

        // TODO: Check if the user gotten has completed registration
        if (user.isFullyRegistered) {
          emit(Authenticated(user: user));
        } else {
          emit(Unauthenticated(user: user));
        }
      } else {
        // Todo: Uncomment emit(Unauthenticated());
        this.user = User.test;
        emit(Unauthenticated(user: this.user));
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

  final UserRepository _userRepository;
  User user;
}
