import 'package:avs/data/models/user.dart';
import 'package:avs/data/repositories/authentication_repository.dart';
import 'package:avs/utils/constants.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'authentication_cubit.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit(this.userRepository, this.authenticationCubit,
      {this.formKey, this.controller})
      : super(OtpState());

  final UserRepository userRepository;
  final AuthenticationCubit authenticationCubit;

  final GlobalKey<FormState> formKey;
  final PageController controller;

  String otpCode;

  Future<void> handleContinue() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      emit(state.copyWith(isLoading: true));
      // Submit phone number

      userRepository
          .verifyOtp(mobile: authenticationCubit.user.mobile, code: otpCode)
          .then((response) {
        if (response.success) {
          // Move to next page
          //authenticationCubit.user = User(mobile: mobile);
          controller.nextPage(
              duration: kAnimationDuration, curve: Curves.linear);
        } else {
          emit(
            OtpState.error('Something went wrong, please try again later'),
          );
        }
      }).catchError((error) {
        print(error);
        if (error is Exception) {
          emit(OtpState.error(error.toString()));
        } else if (error is Error) {
          emit(OtpState.error(error.toString()));
        } else {
          emit(OtpState.error(error));
        }
      });
    } else {
      emit(state.copyWith(autovalidateMode: AutovalidateMode.always));
    }
  }
}
