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

part 'phone_number_state.dart';

class PhoneNumberCubit extends Cubit<PhoneNumberState> {
  PhoneNumberCubit(this.userRepository, this.authenticationCubit,
      {this.formKey, this.controller})
      : super(PhoneNumberState());

  final AuthenticationRepository userRepository;
  final AuthenticationCubit authenticationCubit;

  final GlobalKey<FormState> formKey;
  final PageController controller;

  String mobile;

  Future<void> handleContinue(BuildContext context) async {
    FocusScope.of(context).unfocus();
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      emit(state.copyWith(isLoading: true));
      // Submit phone number

      userRepository.sendOtp(mobile).then((response) {
        if (response.success) {
          // Move to next page
          authenticationCubit.mobile = mobile;
          controller.nextPage(
              duration: kAnimationDuration, curve: Curves.linear);
        } else {
          emit(
            state.error('Something went wrong, please try again later'),
          );
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
}
