part of 'address_confirm_cubit.dart';

class AddressConfirmState extends Equatable {
  AddressConfirmState({
    this.isLoading = false,
    this.snackBar,
    this.dialog,
  });

  final bool isLoading;
  final Widget snackBar;
  final Widget dialog;

  AddressConfirmState copyWith({
    final bool isLoading,
    final Widget snackBar,
    final Widget dialog,
    final bool clearOverlays = false,
  }) {
    return AddressConfirmState(
      isLoading: isLoading ?? this.isLoading,
      snackBar: clearOverlays ? null : snackBar ?? this.snackBar,
      dialog: clearOverlays ? null : dialog ?? this.dialog,
    );
  }

  AddressConfirmState error(String message) {
    return this.copyWith(
      isLoading: false,
      snackBar: AppSnackBar.error(message),
    );
  }

  @override
  List<Object> get props => [dialog, isLoading, snackBar];
}
