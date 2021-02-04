part of 'set_password_cubit.dart';

class SetPasswordState extends Equatable {
  SetPasswordState(
      {this.hidePassword = true,
      this.autovalidateMode = AutovalidateMode.disabled,
      this.isLoading = false,
      this.snackBar});

  SetPasswordState error(String message) {
    return this.copyWith(
      isLoading: false,
      snackBar: AppSnackBar.error(message),
    );
  }

  final bool hidePassword;
  final AutovalidateMode autovalidateMode;
  final bool isLoading;
  final Widget snackBar;

  SetPasswordState copyWith({
    final bool hidePassword,
    final AutovalidateMode autovalidateMode,
    final bool isLoading,
    final Widget snackBar,
    final bool clearOverlays = false,
  }) {
    return SetPasswordState(
      hidePassword: hidePassword ?? this.hidePassword,
      autovalidateMode: autovalidateMode ?? this.autovalidateMode,
      isLoading: isLoading ?? this.isLoading,
      snackBar: clearOverlays ? null : snackBar ?? this.snackBar,
    );
  }

  @override
  // TODO: implement props
  List<Object> get props =>
      [hidePassword, autovalidateMode, isLoading, snackBar];
}
