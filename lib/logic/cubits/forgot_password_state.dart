part of 'forgot_password_cubit.dart';

class ForgotPasswordState extends Equatable {
  ForgotPasswordState({
    this.autovalidateMode = AutovalidateMode.disabled,
    this.isLoading = false,
    this.snackBar,
  });

  final bool isLoading;
  final Widget snackBar;
  final AutovalidateMode autovalidateMode;

  ForgotPasswordState copyWith({
    final bool hidePassword,
    final bool isLoading,
    final Widget snackBar,
    final AutovalidateMode autovalidateMode,
    final bool clearOverlays = false,
  }) {
    return ForgotPasswordState(
      isLoading: isLoading ?? this.isLoading,
      snackBar: clearOverlays ? null : snackBar ?? this.snackBar,
      autovalidateMode: autovalidateMode ?? this.autovalidateMode,
    );
  }

  @override
  List<Object> get props => [autovalidateMode, isLoading, snackBar];

  ForgotPasswordState error(String message) {
    return this.copyWith(
      isLoading: false,
      snackBar: AppSnackBar.error(message),
    );
  }
}
