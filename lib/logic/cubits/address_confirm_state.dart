part of 'address_confirm_cubit.dart';

class AddressConfirmState extends Equatable {
  AddressConfirmState({
    this.isLoading = false,
    this.errorMessage,
    this.dialog,
  });

  AddressConfirmState error(String message) => this.copyWith(
        isLoading: false,
        errorMessage: message,
      );

  final bool isLoading;
  final String errorMessage;
  final Widget dialog;

  bool get hasError => errorMessage != null;

  AddressConfirmState copyWith({
    final bool isLoading,
    final String errorMessage,
    final Widget dialog,
    final bool removeDialogs = false,
  }) {
    return AddressConfirmState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: removeDialogs ? null : errorMessage ?? this.errorMessage,
      dialog: removeDialogs ? null : dialog ?? this.dialog,
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [dialog, isLoading, errorMessage];
}
