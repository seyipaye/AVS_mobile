part of 'phone_number_cubit.dart';

class PhoneNumberState extends Equatable {
  PhoneNumberState(
      {this.phoneNumber,
      this.autovalidateMode = AutovalidateMode.disabled,
      this.isLoading = false,
      this.errorMessage});

  factory PhoneNumberState.error(String message) => PhoneNumberState(
        isLoading: false,
        errorMessage: message,
      );

  final String phoneNumber;
  final AutovalidateMode autovalidateMode;
  final bool isLoading;
  final String errorMessage;

  bool get hasError => errorMessage != null;

  PhoneNumberState copyWith({
    final String phoneNumber,
    final AutovalidateMode autovalidateMode,
    final bool isLoading,
  }) {
    return PhoneNumberState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      autovalidateMode: autovalidateMode ?? this.autovalidateMode,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  // TODO: implement props
  List<Object> get props =>
      [phoneNumber, autovalidateMode, isLoading, errorMessage];
}
