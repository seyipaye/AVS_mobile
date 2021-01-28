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
import 'package:geolocator/geolocator.dart';
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

  Future<void> handleContinue(BuildContext context) async {
    // Tell backend, agent is at location
    //emit(state.copyWith(isLoading: true));
    if (authenticationCubit.user != null) {
      final message = await userRepository
          .verifyAddress(authenticationCubit)
          .catchError((error) {
        print(error);
        emit(state.copyWith(isLoading: false));
      });
      if (message != null) {
        emit(state.copyWith(isLoading: false, dialog: successDialog()));
      }
    } else {
      emit(state.error('Something went wrong, please try again later'));
    }
    return;

    if (authenticationCubit.user?.address?.geo?.coordinates?.isNotEmpty ??
        false) {
      // Get device current location
      emit(state.copyWith(isLoading: true));
      _determinePosition().then(
        (position) async {
          if (position != null) {
            print('${position.longitude}...${position.latitude}');
            print(authenticationCubit.user.address?.geo?.coordinates);

            List<double> coordinates =
                authenticationCubit.user.address.geo.coordinates;

            // Get distance
            double distanceInMeters = Geolocator.distanceBetween(
                position.latitude,
                position.longitude,
                coordinates.last,
                coordinates.first);
            print(distanceInMeters);

            //Todo: Check if greater then 5KM
            if (distanceInMeters < 5000) {
              emit(state.copyWith(
                  dialog: failureDialog(distanceInMeters), isLoading: false));
            } else {
              // Tell backend, agent is at location
              if (authenticationCubit.user != null) {
                final message =
                    await userRepository.verifyAddress(authenticationCubit);
                if (message != null) {
                  emit(state.copyWith(
                      isLoading: false, dialog: successDialog()));
                }
              } else {
                emit(state
                    .error('Something went wrong, please try again later'));
              }
            }
          }
        },
      ).catchError((error) {
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
      emit(state.copyWith(
          errorMessage: 'Something went wrong, please try again later'));
    }
  }

  successDialog() => AppConfirmationDialog(
        icon: Icon(
          LineIcons.check_circle,
          size: 100,
          color: Colors.lightGreen,
        ),
        title: "Well done, ${authenticationCubit.user.firstName}!",
        buttonTitle: 'Proceed',
        content:
            "You've fully completed the registration process. You can start earning money as an Agent now",
        onButtonPressed: (BuildContext context) {
          Navigator.of(context).pop();
          // Move to next page
          controller.nextPage(
              duration: kAnimationDuration, curve: Curves.linear);
        },
      );

  failureDialog(double distanceInMeters) => AppConfirmationDialog(
        icon: Icon(
          LineIcons.times_circle,
          size: 100,
          color: Colors.redAccent,
        ),
        title: "Oops!",
        buttonTitle: 'Ok',
        content:
            "You are not in the location hence you can't verify this address. You appear to be ${(distanceInMeters / 1000).toStringAsFixed(2)} Kilometers away from your registered address. Please try again when you are at the location",
        onButtonPressed: (BuildContext context) {
          Navigator.of(context).pop();
          authenticationCubit.skipRegistration();
        },
      );

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return Future.error(
            'Location permissions are denied (actual value: $permission).');
      }
    }

    return await Geolocator.getCurrentPosition();
  }
}
