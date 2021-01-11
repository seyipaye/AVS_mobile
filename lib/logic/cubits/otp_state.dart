part of 'otp_cubit.dart';

class OtpState extends Equatable {
  OtpState(
      {this.autovalidateMode = AutovalidateMode.disabled,
      this.isLoading = false,
      this.errorMessage});

  factory OtpState.error(String message) => OtpState(
        isLoading: false,
        errorMessage: message,
      );

  final AutovalidateMode autovalidateMode;
  final bool isLoading;
  final String errorMessage;

  bool get hasError => errorMessage != null;

  OtpState copyWith({
    final String phoneNumber,
    final AutovalidateMode autovalidateMode,
    final bool isLoading,
  }) {
    return OtpState(
      autovalidateMode: autovalidateMode ?? this.autovalidateMode,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [autovalidateMode, isLoading, errorMessage];
}
