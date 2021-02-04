import 'package:avs/data/providers/avs_api_client.dart';
import 'package:avs/data/repositories/authentication_repository.dart';
import 'package:avs/utils/constants.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../presentation/widgets/app_snack_bar.dart';
import 'authentication_cubit.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.userRepository, this.authenticationCubit, {this.controller})
      : super(LoginState());

  final AuthenticationRepository userRepository;
  final AuthenticationCubit authenticationCubit;

  final PageController controller;

  String email;
  String password;

  void handleContinue(BuildContext context) {
    FocusScope.of(context).unfocus();
    final form = Form.of(context);
    if (form.validate()) {
      form.save();
      emit(state.copyWith(isLoading: true));

      userRepository.login(email: email, password: password).then((user) async {
        if (user != null) {
          authenticationCubit.authenticatedUser = user;
        } else {
          emit(state.error('Something went wrong, please try again later'));
        }
      }).catchError((error) {
        if (error is DioError) {
          emit(state.error(error.message));
        } else {
          emit(state.error(Error.safeToString(error)));
        }
      });
    } else {
      emit(state.copyWith(autovalidateMode: AutovalidateMode.always));
    }
  }

  clearOverlays(_) {
    emit(state.copyWith(clearOverlays: true));
  }

  void togglePasswordVisibility() {
    emit(state.copyWith(hidePassword: !state.hidePassword));
  }

  void moveToSignUp() {
    controller.animateToPage(2,
        duration: kAnimationDuration, curve: Curves.linear);
  }

  void moveToForgotPassword() {
    controller.animateToPage(0,
        duration: kAnimationDuration, curve: Curves.linear);
  }
}
