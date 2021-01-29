import 'dart:developer';

import 'package:avs/data/models/request.dart';
import 'package:avs/data/repositories/request_repository.dart';
import 'package:avs/presentation/widgets/app_raised_button.dart';
import 'package:avs/presentation/widgets/app_snack_bar.dart';
import 'package:avs/presentation/widgets/dialogs.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../authentication_cubit.dart';

part 'request_details_state.dart';

class RequestDetailsCubit extends Cubit<RequestDetailsState> {
  RequestDetailsCubit(AuthenticationCubit _authCubit, this._request)
      : repository = RequestRepository(_authCubit),
        super(RequestDetailsState(request: _request));

  final RequestRepository repository;
  final Request _request;

  clearOverlays(_) {
    //log('clear');
    emit(state.copyWith(clearOverlays: true));
  }

  void onRejectPressed(mainContext) {
    emit(
      state.copyWith(
        dialog: MultipleButtonDialog(
          title: 'Reject Request',
          content: 'Are you sure you want to reject this request?',
          buttons: [
            AppRaisedButton(
              text: 'No',
              backgroundColor: Colors.grey,
              onPressed: (context) {
                Navigator.of(context).pop();
              },
            ),
            AppRaisedButton(
              text: 'Yes',
              onPressed: (context) {
                Navigator.of(context).pop();
                emit(state.copyWith(isLoading: true, clearOverlays: true));
                repository.rejectRequest(id: _request.id).then((value) {
                  emit(state.copyWith(
                    isLoading: false,
                    snackBar: AppSnackBar.success(value),
                  ));
                  Future.delayed(Duration(seconds: 2)).then((_) {
                    Navigator.of(mainContext).pop();
                  });
                }).catchError((error) {
                  print(error);
                  if (error is DioError) {
                    emit(state.copyWith(
                        isLoading: false,
                        snackBar: AppSnackBar.error(error.message)));
                  }
                });
              },
            )
          ],
        ),
      ),
    );
  }

  void onAcceptPressed(mainContext) {
    /*Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MapScreen(
          request: _request,
        ),
      ),
    );*/
    emit(
      state.copyWith(
        dialog: MultipleButtonDialog(
          title: 'Accept Request',
          content: 'Are you sure you want to accept this request?',
          buttons: [
            AppRaisedButton(
              text: 'No',
              backgroundColor: Colors.grey,
              onPressed: (context) {
                Navigator.of(context).pop();
              },
            ),
            AppRaisedButton(
              text: 'Yes',
              onPressed: (context) {
                Navigator.of(context).pop();
                emit(state.copyWith(isLoading: true, clearOverlays: true));
                repository.acceptRequest(id: _request.id).then((value) {
                  emit(state.copyWith(
                    isLoading: false,
                    snackBar: AppSnackBar.success(value),
                  ));
                  Future.delayed(Duration(seconds: 2)).then((_) {
                    Navigator.of(mainContext).pop();
                  });
                }).catchError((error) {
                  print(error);
                  if (error is DioError) {
                    emit(state.copyWith(
                        isLoading: false,
                        snackBar: AppSnackBar.error(error.message)));
                  }
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
