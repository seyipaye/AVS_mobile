import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class UpdatePasswordState extends Equatable {
  final bool hideOldPassword;
  final bool hideNewPassword;
  final bool hideConfirmPassword;
  final bool isLoading;
  final String errorMessage;
  final AutovalidateMode autovalidateMode;

  UpdatePasswordState(
      {this.autovalidateMode = AutovalidateMode.disabled,
      this.isLoading = false,
      this.errorMessage,
      this.hideOldPassword = true,
      this.hideNewPassword = true,
      this.hideConfirmPassword = true});

  UpdatePasswordState copyWith({
    final bool hideOldPassword,
    final bool hideNewPassword,
    final bool hideConfirmPassword,
    final bool isLoading,
    final AutovalidateMode autovalidateMode,
  }) {
    return UpdatePasswordState(
      hideOldPassword: hideOldPassword ?? this.hideOldPassword,
      hideNewPassword: hideNewPassword ?? this.hideNewPassword,
      hideConfirmPassword: hideConfirmPassword ?? this.hideConfirmPassword,
      isLoading: isLoading ?? this.isLoading,
      autovalidateMode: autovalidateMode ?? this.autovalidateMode,
    );
  }

  @override
  List<Object> get props => [
        hideOldPassword,
        hideNewPassword,
        hideConfirmPassword,
        autovalidateMode,
        isLoading,
        errorMessage
      ];
}
