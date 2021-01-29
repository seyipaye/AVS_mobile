import 'dart:io';

import 'package:avs/data/repositories/authentication_repository.dart';
import 'package:avs/data/repositories/update_repository.dart';
import 'package:avs/logic/cubits/update_password_state.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpdatePasswordCubit extends Cubit<UpdatePasswordState> {
  UpdatePasswordCubit(
    this.repository,
  ) : super(UpdatePasswordState());
  final UpdateRepository repository;

  String oldPassword;
  String newPassword;
  String confirmPassword;

  handleClick(BuildContext context) async {
    FocusScope.of(context).unfocus();
    final form = Form.of(context);
    form.save();
    if (form.validate() && confirmPassword == newPassword) {
      emit(state.copyWith(isLoading: true));
      await repository
          .updatePassword(oldPassword: oldPassword, newPassword: newPassword)
          .then((value) async {
        form.reset();
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text('Password Successfully Updated'),
            duration: Duration(seconds: 3),
          ),
        );
      }).catchError((e) {
        if (e is DioError) {
          if (e.error is SocketException) {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text('Unable to update password at this time'),
              duration: Duration(seconds: 3),
            ));
          } else {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text('Password doesn\'t math our records'),
              duration: Duration(seconds: 3),
            ));
          }
        }

        emit(UpdatePasswordState().copyWith(isLoading: false));
      });
      emit(UpdatePasswordState().copyWith(isLoading: false));
    } else if (oldPassword != newPassword) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Passwords must match'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  togglePasswordVisibility(int index) {
    switch (index) {
      case 0:
        {
          emit(state.copyWith(hideOldPassword: !state.hideOldPassword));
        }
        break;

      case 1:
        {
          emit(state.copyWith(hideNewPassword: !state.hideNewPassword));
        }
        break;

      case 2:
        {
          emit(state.copyWith(hideConfirmPassword: !state.hideConfirmPassword));
        }
        break;

      default:
        {
          throw ('Inaccessible Index on form');
        }
        break;
    }
  }
}
