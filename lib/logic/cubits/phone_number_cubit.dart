import 'package:avs/data/models/user.dart';
import 'package:avs/data/repositories/authentication_repository.dart';
import 'package:avs/utils/constants.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'authentication_cubit.dart';

part 'phone_number_state.dart';

class PhoneNumberCubit extends Cubit<PhoneNumberState> {
  PhoneNumberCubit(this.userRepository, this.authenticationCubit,
      {this.formKey, this.controller})
      : super(PhoneNumberState());

  final UserRepository userRepository;
  final AuthenticationCubit authenticationCubit;

  final GlobalKey<FormState> formKey;
  final PageController controller;

  String mobile;

  Future<void> handleContinue() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      emit(state.copyWith(isLoading: true));
      // Submit phone number

      userRepository.sendOtp(mobile).then((response) {
        if (response.success) {
          // Move to next page
          authenticationCubit.user = User(mobile: mobile);
          controller.nextPage(
              duration: kAnimationDuration, curve: Curves.linear);
        } else {
          emit(
            PhoneNumberState.error(
                'Something went wrong, please try again later'),
          );
        }
      }).catchError((error) {
        print(error);
        if (error is Exception) {
          emit(PhoneNumberState.error(error.toString()));
        } else if (error is Error) {
          emit(PhoneNumberState.error(error.toString()));
        } else {
          emit(PhoneNumberState.error(error));
        }
      });
    } else {
      emit(state.copyWith(autovalidateMode: AutovalidateMode.always));
    }
  }
}
