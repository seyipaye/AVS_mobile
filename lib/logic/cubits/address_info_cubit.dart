import 'package:avs/data/api_responses/location_response.dart';
import 'package:avs/data/models/address.dart';
import 'package:avs/data/providers/avs_api_client.dart';
import 'package:avs/data/repositories/authentication_repository.dart';
import 'package:avs/utils/constants.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';

import 'authentication_cubit.dart';

part 'address_info_state.dart';

const kGoogleApiKey = "AIzaSyDWzGqryJyULurQz_nOuTz5L-tktCz60JE";

class AddressInfoCubit extends Cubit<AddressInfoState> {
  AddressInfoCubit(this.userRepository, this.authenticationCubit,
      {this.controller})
      : super(AddressInfoState());

  final PageController controller;
  final UserRepository userRepository;
  final AuthenticationCubit authenticationCubit;

  onStreetAddressTap(BuildContext context) async {
    PlacesAutocomplete.show(
            context: context,
            apiKey: kGoogleApiKey,
            mode: Mode.overlay, // Mode.fullscreen
            language: "en",
            components: [new Component(Component.country, "ng")])
        .then((Prediction p) {
      emit(state.copyWith(streetAddress: p.description));
    });
  }

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

  void dialogClosed() {
    emit(state.copyWith(clearMessage: true));
  }

  void handleContinue(BuildContext context) {
    FocusScope.of(context).unfocus();
    final form = Form.of(context);
    if (form.validate()) {
      form.save();
      emit(state.copyWith(isLoading: true));

      userRepository
          .addAddress(
              id: authenticationCubit.user.id,
              address: Address(
                  streetAddress: state.streetAddress,
                  state: state.selectedAddressState.name,
                  lga: state.selectedAddressLocalGovernment.name,
                  postalCode: state.postalCode))
          .then((addressResponse) {
        if (addressResponse != null) {
          authenticationCubit.userAddress = addressResponse.agent.address;
          authenticationCubit.tokens = addressResponse.tokens;
          controller.nextPage(
              duration: kAnimationDuration, curve: Curves.bounceOut);
        } else {
          emit(state.error('Something went wrong, please try again later'));
        }
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
      emit(state.copyWith(autovalidateMode: AutovalidateMode.always));
    }
  }
}
