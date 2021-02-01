part of 'request_details_cubit.dart';

class RequestDetailsState extends Equatable {
  final bool isLoading;
  final Request request;
  final Widget snackBar;
  final Widget dialog;

  const RequestDetailsState(
      {this.dialog, this.request, this.isLoading = false, this.snackBar});

  RequestDetailsState copyWith({
    final bool isLoading,
    final Request request,
    final Widget snackBar,
    final Widget dialog,
    final bool clearOverlays = false,
  }) {
    return RequestDetailsState(
      isLoading: isLoading ?? this.isLoading,
      request: request ?? this.request,
      snackBar: clearOverlays ? null : snackBar ?? this.snackBar,
      dialog: clearOverlays ? null : dialog ?? this.dialog,
    );
  }

  @override
  List<Object> get props => [dialog, isLoading, request, snackBar];
}
