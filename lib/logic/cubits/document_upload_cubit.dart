import 'package:avs/data/models/document.dart';
import 'package:avs/data/providers/avs_api_client.dart';
import 'package:avs/data/repositories/authentication_repository.dart';
import 'package:avs/utils/constants.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'authentication_cubit.dart';

part 'document_upload_state.dart';

class DocumentUploadCubit extends Cubit<DocumentUploadState> {
  DocumentUploadCubit(this.userRepository, this.authenticationCubit,
      {this.controller})
      : super(DocumentUploadState());

  final UserRepository userRepository;
  final AuthenticationCubit authenticationCubit;

  final PageController controller;

  String firstName;
  String lastName;
  String otherNames;
  String email;
  Document _selectedDoc;
  bool isLoading;

  void onDocChanged(Document doc) {
    _selectedDoc = doc;
    emit(state.copyWith(selectedDoc: doc));
  }

  void handleContinue(BuildContext context) {
    FocusScope.of(context).unfocus();
    final form = Form.of(context);
    if (form.validate()) {
      form.save();
      // authenticationCubit.setUserInfo(
      //   firstName: this.firstName,
      //   lastName: this.lastName,
      //   otherName: this.otherNames,
      //   email: this.email,
      //   gender: this.gender,
      // );
      //print(authenticationCubit.user);
      emit(state.copyWith(isLoading: true));

      userRepository.setUser(user: authenticationCubit.user).then((user) {
        if (user != null) {
          emit(state.copyWith(isLoading: false, showCompletionDialog: true));
        } else {
          emit(DocumentUploadState.error(
              'Something went wrong, please try again later'));
        }
      }).catchError((error) {
        print(error);
        if (error is ClientError || error is Exception) {
          emit(DocumentUploadState.error(error.message));
        } else if (error is Error) {
          emit(DocumentUploadState.error(Error.safeToString(error)));
        } else {
          emit(DocumentUploadState.error(error));
        }
      });
    } else {
      emit(state.copyWith(autovalidateMode: AutovalidateMode.always));
    }
  }

  //void selected

  void onNegativePressed(BuildContext context) {
    Navigator.of(context).pop();
    authenticationCubit.skipRegistration();
  }
}
