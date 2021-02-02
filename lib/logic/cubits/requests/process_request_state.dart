part of 'process_request_cubit.dart';

class ProcessRequestState extends Equatable {
  const ProcessRequestState({
    this.status = AddressStatus.Unknown,
    this.autovalidateMode,
    this.reasons,
    this.assessment,
    this.images,
    this.isLoading = false,
    this.isGeoTagged = false,
    this.snackBar,
  });

  final AutovalidateMode autovalidateMode;
  final AddressStatus status;
  final List<String> reasons;
  final String assessment;
  final List<Document> images;
  final bool isGeoTagged;
  final bool isLoading;
  final Widget snackBar;

  ProcessRequestState copyWith({
    final AutovalidateMode autovalidateMode,
    final AddressStatus status,
    final List<String> reasons,
    final String assessmentDetail,
    final List<Document> images,
    final bool isLoading,
    final Widget snackBar,
    final bool isGeoTagged,
    final bool clearOverlays = false,
  }) {
    return ProcessRequestState(
      autovalidateMode: autovalidateMode ?? this.autovalidateMode,
      status: status ?? this.status,
      reasons: reasons ?? this.reasons,
      assessment: assessmentDetail ?? this.assessment,
      images: images ?? this.images,
      isLoading: isLoading ?? this.isLoading,
      isGeoTagged: isGeoTagged ?? this.isGeoTagged,
      snackBar: clearOverlays ? null : snackBar ?? this.snackBar,
    );
  }

  @override
  List<Object> get props => [
        status,
        reasons,
        assessment,
        images,
        isLoading,
        snackBar,
        autovalidateMode,
        isGeoTagged
      ];
}
