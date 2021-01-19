part of 'login_cubit.dart';

class LoginState extends Equatable {
  LoginState(
      {this.autovalidateMode = AutovalidateMode.disabled,
      this.isLoading = false,
      this.errorMessage,
      this.hidePassword = true});

  factory LoginState.error(String message) => LoginState(
        isLoading: false,
        errorMessage: message,
      );

  final bool hidePassword;
  final bool isLoading;
  final String errorMessage;
  final AutovalidateMode autovalidateMode;

  bool get hasError => errorMessage != null;

  LoginState copyWith({
    final bool hidePassword,
    final bool isLoading,
    final AutovalidateMode autovalidateMode,
  }) {
    return LoginState(
      hidePassword: hidePassword ?? this.hidePassword,
      isLoading: isLoading ?? this.isLoading,
      autovalidateMode: autovalidateMode ?? this.autovalidateMode,
    );
  }

  @override
  // TODO: implement props
  List<Object> get props =>
      [hidePassword, autovalidateMode, isLoading, errorMessage];
}
