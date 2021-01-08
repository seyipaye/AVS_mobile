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
    // Initialize App
    //userRepository.hasToken()

    userRepository.getUser().then((user) {
      if (user != null) {
        this._user = user;
        emit(Authenticated());
      } else {
        emit(Unauthenticated());
      }
    }).catchError((error) {
      emit(AuthError(error.toString()));
    });

    /*final bool hasToken = await

    if (hasToken) {
      yield AuthenticationAuthenticated();
    } else {
      yield AuthenticationUnauthenticated();
    }*/
  }

  final UserRepository _userRepository;
  User _user;
}
