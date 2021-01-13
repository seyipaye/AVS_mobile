part of 'set_password_cubit.dart';

class SetPasswordState extends Equatable {
  SetPasswordState(
      {this.hidePassword = true,
      this.autovalidateMode = AutovalidateMode.disabled,
      this.isLoading = false,
      this.errorMessage});

  factory SetPasswordState.error(String message) => SetPasswordState(
        isLoading: false,
        errorMessage: message,
      );

  final bool hidePassword;
  final AutovalidateMode autovalidateMode;
  final bool isLoading;
  final String errorMessage;

  bool get hasError => errorMessage != null;

  SetPasswordState copyWith({
    final bool hidePassword,
    final AutovalidateMode autovalidateMode,
    final bool isLoading,
  }) {
    return SetPasswordState(
      hidePassword: hidePassword ?? this.hidePassword,
      autovalidateMode: autovalidateMode ?? this.autovalidateMode,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  // TODO: implement props
  List<Object> get props =>
      [hidePassword, autovalidateMode, isLoading, errorMessage];
}
