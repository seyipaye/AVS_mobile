part of 'phone_number_cubit.dart';

class PhoneNumberState extends Equatable {
  PhoneNumberState(
      {this.phoneNumber,
      this.autovalidateMode = AutovalidateMode.disabled,
      this.isLoading = false,
      this.snackBar});

  final String phoneNumber;
  final AutovalidateMode autovalidateMode;
  final bool isLoading;
  final Widget snackBar;

  PhoneNumberState copyWith({
    final String phoneNumber,
    final AutovalidateMode autovalidateMode,
    final bool isLoading,
    final Widget snackBar,
    bool clearOverlays = false,
  }) {
    return PhoneNumberState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      autovalidateMode: autovalidateMode ?? this.autovalidateMode,
      snackBar: clearOverlays ? null : snackBar ?? this.snackBar,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  PhoneNumberState error(String message) {
    return this.copyWith(
      isLoading: false,
      snackBar: AppSnackBar.error(message),
    );
  }

  @override
  // TODO: implement props
  List<Object> get props =>
      [phoneNumber, autovalidateMode, isLoading, snackBar];
}
