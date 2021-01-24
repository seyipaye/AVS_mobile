import 'package:avs/data/models/document.dart';
import 'package:avs/data/providers/avs_api_client.dart';
import 'package:avs/data/repositories/authentication_repository.dart';
import 'package:avs/utils/validators.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

import 'authentication_cubit.dart';

part 'document_upload_state.dart';

class DocumentUploadCubit extends Cubit<DocumentUploadState> {
  DocumentUploadCubit(this.userRepository, this.authenticationCubit,
      {this.controller})
      : super(DocumentUploadState());

  final UserRepository userRepository;
  final AuthenticationCubit authenticationCubit;
  final PageController controller;

  final ImagePicker _picker = ImagePicker();

  PickedFile _photoFile;
  bool isLoading;

  set selectedDoc(Document doc) {
    emit(state.copyWith(selectedDoc: doc));
  }

  void handleContinue(BuildContext context) {
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
            emit(state.copyWith(isLoading: false, showCompletionDialog: true));
          } else {
            _showError('Something went wrong, please try again later');
          }
        }).catchError((error) {
          print(error);
          if (error is ClientError || error is Exception) {
            _showError(error.message);
          } else if (error is Error) {
            _showError(Error.safeToString(error));
          } else {
            _showError(error);
          }
        });
      } else {
        _showError(Validator.isProfilePhoto(_photoFile));
      }
    } else {
      emit(state.copyWith(autovalidateMode: AutovalidateMode.always));
    }
  }

  //void selected

  void _showError(String error) {
    emit(state.copyWith(isLoading: false, errorMessage: error));
    Future.delayed(Duration(seconds: 1), () {
      emit(state.copyWith(errorMessage: ''));
    });
  }

  Future<void> onUploadPhotoPressed(BuildContext context) async {
    _picker
        .getImage(source: ImageSource.gallery, imageQuality: 50)
        .then((value) {
      _photoFile = value;
      emit(state.copyWith(photoFile: value));
    }).catchError((error) {
      if (error is Exception) {
        _showError((error as dynamic).message);
      } else {
        _showError(Error.safeToString(error));
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
        _showError('User canceled the operation');
      }
    }).catchError((error) {
      if (error is Exception) {
        _showError((error as dynamic).message);
      } else {
        _showError(Error.safeToString(error));
      }
    });
  }
}
