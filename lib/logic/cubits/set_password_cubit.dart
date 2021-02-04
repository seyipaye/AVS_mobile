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

part 'set_password_state.dart';

class SetPasswordCubit extends Cubit<SetPasswordState> {
  SetPasswordCubit(this.userRepository, this.authenticationCubit,
      {this.controller})
      : super(SetPasswordState());

  final AuthenticationRepository userRepository;
  final AuthenticationCubit authenticationCubit;

  final PageController controller;

  String password;
  String confirmPassword;

  Future<void> handleContinue(BuildContext context) async {
    FocusScope.of(context).unfocus();
    final form = Form.of(context);
    if (form.validate()) {
      form.save();
      if (password == confirmPassword) {
        print(authenticationCubit.user);
        emit(state.copyWith(isLoading: true));

        userRepository
            .setPassword(
                mobile: authenticationCubit.user.mobile, password: password)
            .then((id) {
          if (id != null) {
            // Move to next page
            authenticationCubit.authId = id;
            controller.nextPage(
                duration: kAnimationDuration, curve: Curves.linear);
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
        emit(state.error('Passwords do not match'));
      }
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
}
