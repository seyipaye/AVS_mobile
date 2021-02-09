import 'package:avs/data/providers/avs_api_client.dart';
import 'package:avs/data/repositories/authentication_repository.dart';
import 'package:avs/utils/constants.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../presentation/widgets/app_snack_bar.dart';
import 'authentication_cubit.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit(this.userRepository, this.authenticationCubit,
      {this.controller})
      : super(ForgotPasswordState());

  final AuthenticationRepository userRepository;
  final AuthenticationCubit authenticationCubit;

  final PageController controller;

  String email;

  void handleContinue(BuildContext context) {
    FocusScope.of(context).unfocus();
    final form = Form.of(context);
    if (form.validate()) {
      form.save();
      emit(state.copyWith(isLoading: true));

      userRepository.forgotPassword(email: email).then((message) async {
        if (message != null) {
          emit(state.copyWith(snackBar: AppSnackBar.success(message)));
          Future.delayed(Duration(seconds: 3)).then((_) {
            controller.animateToPage(1,
                duration: kAnimationDuration, curve: Curves.linear);
          });
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
      emit(state.copyWith(autovalidateMode: AutovalidateMode.always));
    }
  }

  clearOverlays(_) {
    emit(state.copyWith(clearOverlays: true));
  }
}
