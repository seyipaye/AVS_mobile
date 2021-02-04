import 'package:avs/data/models/document.dart';
import 'package:avs/data/providers/avs_api_client.dart';
import 'package:avs/data/repositories/authentication_repository.dart';
import 'package:avs/utils/constants.dart';
import 'package:avs/utils/validators.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

import '../../presentation/widgets/app_snack_bar.dart';
import 'authentication_cubit.dart';

part 'document_upload_state.dart';

class DocumentUploadCubit extends Cubit<DocumentUploadState> {
  DocumentUploadCubit(this.userRepository, this.authenticationCubit,
      {this.controller})
      : super(
            DocumentUploadState(firstName: authenticationCubit.user.firstName));

  final AuthenticationRepository userRepository;
  final AuthenticationCubit authenticationCubit;
  final PageController controller;

  final ImagePicker _picker = ImagePicker();

  PickedFile _photoFile;
  bool isLoading;

  set selectedDoc(Document doc) {
    emit(state.copyWith(selectedDoc: doc));
  }

  void handleContinue(BuildContext context) {
    //print('ffe ${authenticationCubit.user}');

    FocusScope.of(context).unfocus();
    final form = Form.of(context);
    if (form.validate()) {
      if (Validator.isProfilePhoto(_photoFile) == null) {
        form.save();
        emit(state.copyWith(isLoading: true));

        userRepository
            .uploadDocs(authenticationCubit.user,
                photoPath: _photoFile.path, doc: state.selectedDoc)
            .then((message) {
          if (message != null) {
            emit(state.copyWith(isLoading: false));
            controller.nextPage(
                duration: kAnimationDuration, curve: Curves.bounceOut);
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
        emit(state.error(Validator.isProfilePhoto(_photoFile)));
      }
    } else {
      emit(state.copyWith(autovalidateMode: AutovalidateMode.always));
    }
  }

  Future<void> onUploadPhotoPressed(BuildContext context) async {
    _picker
        .getImage(source: ImageSource.gallery, imageQuality: 50)
        .then((value) {
      _photoFile = value;
      emit(state.copyWith(photoFile: value));
    }).catchError((error) {
      if (error is Exception) {
        emit(state.error((error as dynamic).message));
      } else {
        emit(state.error(Error.safeToString(error)));
      }
    });
  }

  Future<void> onUploadDocPressed() async {
    // TODO: Test with files selected from google drive
    FilePicker.platform.pickFiles().then((result) {
      //print(result.files.single.path);
      if (result != null) {
        selectedDoc =
            state.selectedDoc.copyWith(value: result.files.single.path);
      } else {
        emit(state.error('User canceled the operation'));
      }
    }).catchError((error) {
      if (error is Exception) {
        emit(state.error((error as dynamic).message));
      } else {
        emit(state.error(Error.safeToString(error)));
      }
    });
  }

  clearOverlays(_) {
    emit(state.copyWith(clearOverlays: true));
  }
}
