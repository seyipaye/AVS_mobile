part of 'login_cubit.dart';

class LoginState extends Equatable {
  LoginState({
    this.autovalidateMode = AutovalidateMode.disabled,
    this.isLoading = false,
    this.snackBar,
    this.hidePassword = true,
  });

  final bool hidePassword;
  final bool isLoading;
  final Widget snackBar;
  final AutovalidateMode autovalidateMode;

  LoginState copyWith({
    final bool hidePassword,
    final bool isLoading,
    final Widget snackBar,
    final AutovalidateMode autovalidateMode,
    final bool clearOverlays = false,
  }) {
    return LoginState(
      hidePassword: hidePassword ?? this.hidePassword,
      isLoading: isLoading ?? this.isLoading,
      snackBar: clearOverlays ? null : snackBar ?? this.snackBar,
      autovalidateMode: autovalidateMode ?? this.autovalidateMode,
    );
  }

  @override
  List<Object> get props =>
      [hidePassword, autovalidateMode, isLoading, snackBar];

  LoginState error(String message) {
    return this.copyWith(
      isLoading: false,
      snackBar: AppSnackBar.error(message),
    );
  }
}
