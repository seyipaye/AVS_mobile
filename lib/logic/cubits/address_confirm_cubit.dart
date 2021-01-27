import 'package:avs/data/api_responses/location_response.dart';
import 'package:avs/data/models/address.dart';
import 'package:avs/data/providers/avs_api_client.dart';
import 'package:avs/data/repositories/authentication_repository.dart';
import 'package:avs/presentation/widgets/dialogs.dart';
import 'package:avs/utils/constants.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:line_icons/line_icons.dart';
import 'authentication_cubit.dart';

part 'address_confirm_state.dart';

class AddressConfirmCubit extends Cubit<AddressConfirmState> {
  AddressConfirmCubit(this.userRepository, this.authenticationCubit,
      {this.controller})
      : super(AddressConfirmState());

  final PageController controller;
  final UserRepository userRepository;
  final AuthenticationCubit authenticationCubit;

  void dialogClosed() {
    emit(state.copyWith(removeDialogs: true));
  }

  void handleContinue(BuildContext context) {
    // Get current device location

    // Compare location

    // Tell backend location has been verified
    final double distance = 10000;
/*
    AppConfirmationDialog(
      icon: Icon(
        LineIcons.check_circle,
        size: 100,
        color: Colors.lightGreen,
      ),
      title: "Well done, ${authenticationCubit.user.firstName}!",
      buttonTitle: 'Proceed',
      content:
      "You've fully completed the registration process. You can start earning money as an Agent now",
      onPressed: (BuildContext context) {
        Navigator.of(context).pop();
        // Move to next page
        controller.nextPage(
            duration: kAnimationDuration, curve: Curves.linear);
      },
    )
*/
    /*
    AppConfirmationDialog(
        icon: Icon(
          LineIcons.times_circle,
          size: 100,
          color: Colors.redAccent,
        ),
        title: "Oops!",
        buttonTitle: 'Ok',
        content:
            "You are not in the location hence you can't verify this address. You appear to be ${distance.round()} meters away from your registered address. Please try again when you are at the location",
        onPressed: (BuildContext context) {
          Navigator.of(context).pop();
          // Move to next page
          controller.nextPage(
              duration: kAnimationDuration, curve: Curves.linear);
        },
      ),
    */
    emit(state.copyWith());

    if (authenticationCubit.user.address?.geo?.coordinates?.isNotEmpty ??
        false) {
      emit(state.copyWith(isLoading: true));

      Future.delayed(Duration(seconds: 2), () {
        emit(state.copyWith(isLoading: false));
        // if (user != null) {
        //   //emit(state.copyWith(isLoading: false, showCompletionDialog: true));
        // } else {
        //   emit(AddressConfirmState.error(
        //       'Something went wrong, please try again later'));
        // }
      }).catchError((error) {
        print(error);
        if (error is ClientError || error is Exception) {
          emit(state.error(error.message));
        } else if (error is Error) {
          emit(state.error(Error.safeToString(error)));
        } else {
          emit(state.error(error));
        }
      });
    } else {
      //emit(state.copyWith(errorMessage: 'Something went wrong, please try again later'));
    }
  }
}
