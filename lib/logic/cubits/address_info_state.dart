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
    this.snackBar,
  });

  AddressInfoState error(String message) {
    return this.copyWith(
      isLoading: false,
      snackBar: AppSnackBar.error(message),
    );
  }

  final bool showCompletionDialog;
  final bool isLoading;
  final Widget snackBar;
  final String streetAddress;
  final String postalCode;
  final AutovalidateMode autovalidateMode;
  final AddressResponseState selectedAddressState;
  final AddressResponseLocalGovernment selectedAddressLocalGovernment;

  AddressInfoState copyWith({
    final bool showCompletionDialog,
    final bool isLoading,
    final Widget snackBar,
    final String streetAddress,
    final String postalCode,
    final AutovalidateMode autovalidateMode,
    final AddressResponseState selectedAddressState,
    final AddressResponseLocalGovernment selectedAddressLocalGovernment,
    final bool resetLG = false,
    final bool clearOverlays = false,
  }) {
    return AddressInfoState(
      showCompletionDialog: showCompletionDialog ?? this.showCompletionDialog,
      isLoading: isLoading ?? this.isLoading,
      snackBar: clearOverlays ? null : snackBar ?? this.snackBar,
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
        snackBar
      ];
}
