import 'dart:ffi';

import 'package:avs/data/models/user.dart';
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

part 'user_info_state.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  UserInfoCubit(this.userRepository, this.authenticationCubit,
      {this.controller})
      : super(UserInfoState());

  final AuthenticationRepository userRepository;
  final AuthenticationCubit authenticationCubit;

  final PageController controller;

  String firstName;
  String lastName;
  String otherNames;
  String email;
  String gender;
  bool isLoading;

  void handleContinue(BuildContext context) {
    FocusScope.of(context).unfocus();
    final form = Form.of(context);
    if (form.validate()) {
      form.save();
      authenticationCubit.setUserInfo(
        firstName: this.firstName,
        lastName: this.lastName,
        otherName: this.otherNames,
        email: this.email,
        gender: this.gender,
      );
      //print(authenticationCubit.user);
      emit(state.copyWith(isLoading: true));

      userRepository
          .uploadUserInfo(user: authenticationCubit.user)
          .then((user) {
        if (user != null) {
          //print(user);
          authenticationCubit.freshUser = user;
          print(authenticationCubit.user);
          emit(state.copyWith(isLoading: false, showCompletionDialog: true));
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

  void onPositivePressed(BuildContext context) {
    Navigator.of(context).pop();
    // Move to next page
    controller.nextPage(duration: kAnimationDuration, curve: Curves.linear);
  }

  void onNegativePressed(BuildContext context) {
    Navigator.of(context).pop();
    authenticationCubit.skipRegistration();
  }
}
