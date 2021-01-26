import 'dart:ffi';

import 'package:avs/data/api_responses/location_response.dart';
import 'package:avs/data/models/user.dart';
import 'package:avs/data/providers/avs_api_client.dart';
import 'package:avs/data/repositories/authentication_repository.dart';
import 'package:avs/utils/constants.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'authentication_cubit.dart';

part 'address_info_state.dart';

class AddressInfoCubit extends Cubit<AddressInfoState> {
  AddressInfoCubit(this.userRepository, this.authenticationCubit,
      {this.controller})
      : super(AddressInfoState());

  final PageController controller;
  final UserRepository userRepository;
  final AuthenticationCubit authenticationCubit;

  addressStateChanged(AddressResponseState value) {
    emit(state.copyWith(selectedAddressState: value, resetLG: true));
  }

  set streetAddress(String value) {
    emit(state.copyWith(streetAddress: value));
  }

  set postalCode(String value) {
    emit(state.copyWith(postalCode: value));
  }

  set addressLocalGovernment(
      AddressResponseLocalGovernment addressLocalGovernment) {
    emit(
        state.copyWith(selectedAddressLocalGovernment: addressLocalGovernment));
  }

  void handleContinue(BuildContext context) {
    FocusScope.of(context).unfocus();
    final form = Form.of(context);
    if (form.validate()) {
      form.save();
      emit(state.copyWith(isLoading: true));

      userRepository.addAddress(user: authenticationCubit.user).then((user) {
        if (user != null) {
          emit(state.copyWith(isLoading: false, showCompletionDialog: true));
        } else {
          emit(AddressInfoState.error(
              'Something went wrong, please try again later'));
        }
      }).catchError((error) {
        print(error);
        if (error is ClientError || error is Exception) {
          emit(AddressInfoState.error(error.message));
        } else if (error is Error) {
          emit(AddressInfoState.error(Error.safeToString(error)));
        } else {
          emit(AddressInfoState.error(error));
        }
      });
    } else {
      emit(state.copyWith(autovalidateMode: AutovalidateMode.always));
    }
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
