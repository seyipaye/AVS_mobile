part of 'address_info_cubit.dart';

class AddressInfoState extends Equatable {
  AddressInfoState({
    this.streetAddress,
    this.postalCode,
    this.selectedAddressLocalGovernment,
    this.selectedAddressState,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.isLoading = false,
    this.showCompletionDialog = false,
    this.errorMessage,
  });

  factory AddressInfoState.error(String message) => AddressInfoState(
        isLoading: false,
        errorMessage: message,
      );

  final bool showCompletionDialog;
  final bool isLoading;
  final String errorMessage;
  final String streetAddress;
  final String postalCode;
  final AutovalidateMode autovalidateMode;
  final AddressResponseState selectedAddressState;
  final AddressResponseLocalGovernment selectedAddressLocalGovernment;

  bool get hasError => errorMessage != null;

  AddressInfoState copyWith({
    final bool showCompletionDialog,
    final bool isLoading,
    final String errorMessage,
    final String streetAddress,
    final String postalCode,
    final AutovalidateMode autovalidateMode,
    final AddressResponseState selectedAddressState,
    final AddressResponseLocalGovernment selectedAddressLocalGovernment,
    final bool resetLG = false,
  }) {
    return AddressInfoState(
      showCompletionDialog: showCompletionDialog ?? this.showCompletionDialog,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      streetAddress: streetAddress ?? this.streetAddress,
      postalCode: postalCode ?? this.postalCode,
      autovalidateMode: autovalidateMode ?? this.autovalidateMode,
      selectedAddressState: selectedAddressState ?? this.selectedAddressState,
      selectedAddressLocalGovernment: resetLG
          ? null
          : selectedAddressLocalGovernment ??
              this.selectedAddressLocalGovernment,
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [
        streetAddress,
        postalCode,
        selectedAddressLocalGovernment,
        selectedAddressState,
        autovalidateMode,
        isLoading,
        errorMessage
      ];
}
