import 'package:avs/data/models/document.dart';
import 'package:avs/data/models/request.dart';
import 'package:avs/data/repositories/request_repository.dart';
import 'package:avs/presentation/screens/process_request_screen.dart';
import 'package:avs/presentation/widgets/app_snack_bar.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../authentication_cubit.dart';

part 'process_request_state.dart';

class ProcessRequestCubit extends Cubit<ProcessRequestState> {
  ProcessRequestCubit(AuthenticationCubit _authCubit, this._request)
      : repository = RequestRepository(_authCubit),
        super(ProcessRequestState());

  final ImagePicker _picker = ImagePicker();
  final RequestRepository repository;
  final Request _request;
  Position position;

  clearOverlays(_) {
    emit(state.copyWith(clearOverlays: true));
  }

  setSelectedRadio(AddressStatus val) {
    emit(state.copyWith(status: val));
  }

  geoTagLocation(BuildContext context) async {
    if (await Permission.location.status != PermissionStatus.granted) {
      emit(state.copyWith(
          snackBar: AppSnackBar.error(
              'Please enable location settings to geo tag location')));
    } else {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      emit(state.copyWith(
          isGeoTagged: true,
          snackBar: AppSnackBar.success('Location geo tagged successfully')));
    }
  }

  onSubmitPressed(BuildContext context) {
    FocusScope.of(context).unfocus();
    final form = Form.of(context);

    if (form.validate()) {
      form.save();
      // Validate reasons status
      if (state.status != AddressStatus.Approved &&
          state.status != AddressStatus.Rejected) {
        emit(state.copyWith(
            snackBar: AppSnackBar.error('Please select an Address status')));
        return;
      }
      // Validate reasons selection
      if (state.reasons?.isEmpty ?? true) {
        emit(state.copyWith(
            snackBar: AppSnackBar.error('Please select one or more reasons')));
        return;
      }
      // Validate image upload
      if (state.images?.isEmpty ?? true) {
        emit(state.copyWith(
            snackBar: AppSnackBar.error(
                'Please select one or more images for upload')));
        return;
      }
      //Check position
      if (position == null) {
        emit(state.copyWith(
            snackBar: AppSnackBar.error('Please geo tag location')));
        return;
      }
      // Ride on
      emit(state.copyWith(isLoading: true));
      repository
          .processRequest(
              id: _request.id,
              status: state.status,
              position: position,
              reasons: state.reasons,
              assessment: state.assessment,
              images: state.images)
          .then((value) {
        emit(state.copyWith(
          isLoading: false,
          snackBar: AppSnackBar.success(value),
        ));
        Future.delayed(Duration(seconds: 2)).then((_) {
          Navigator.of(context).pop(value);
        });
      }).catchError((error) {
        print(error);
        if (error is DioError) {
          emit(state.copyWith(
              isLoading: false, snackBar: AppSnackBar.error(error.message)));
        }
      });
    } else {
      emit(state.copyWith(autovalidateMode: AutovalidateMode.always));
    }
  }

  onReasonsSaved(List<String> reasons) {
    emit(state.copyWith(reasons: reasons));
  }

  onDetailSaved(String value) {
    emit(state.copyWith(assessmentDetail: value));
  }

  void uploadImagePressed(BuildContext context) {
    _picker
        .getImage(source: ImageSource.gallery, imageQuality: 30)
        .then((value) {
      emit(state.copyWith(images: [Document(value: value.path)]));
    }).catchError((error) {
      if (error is Exception) {
        emit(state.copyWith(
            snackBar: AppSnackBar.error((error as dynamic).message)));
      } else {
        emit(state.copyWith(
            snackBar: AppSnackBar.error(Error.safeToString(error))));
      }
    });
  }
}
