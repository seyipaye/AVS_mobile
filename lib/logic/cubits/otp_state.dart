part of 'otp_cubit.dart';

class OtpState extends Equatable {
  OtpState({
    this.autovalidateMode = AutovalidateMode.disabled,
    this.isLoading = false,
    this.snackBar,
  });

  final AutovalidateMode autovalidateMode;
  final bool isLoading;
  final Widget snackBar;

  OtpState copyWith({
    final AutovalidateMode autovalidateMode,
    final bool isLoading,
    final Widget snackBar,
    bool clearOverlays = false,
  }) {
    return OtpState(
      autovalidateMode: autovalidateMode ?? this.autovalidateMode,
      isLoading: isLoading ?? this.isLoading,
      snackBar: clearOverlays ? null : snackBar ?? this.snackBar,
    );
  }

  @override
  List<Object> get props => [autovalidateMode, isLoading, snackBar];

  OtpState error(String message) {
    return this.copyWith(
      isLoading: false,
      snackBar: AppSnackBar.error(message),
    );
  }
}
