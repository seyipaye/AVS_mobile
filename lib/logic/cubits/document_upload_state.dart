part of 'document_upload_cubit.dart';

class DocumentUploadState extends Equatable {
  DocumentUploadState({
    this.firstName,
    this.photoFile,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.isLoading = false,
    this.snackBar,
    this.selectedDoc,
  });

  final bool isLoading;
  final Widget snackBar;
  final AutovalidateMode autovalidateMode;
  final Document selectedDoc;
  final PickedFile photoFile;
  final String firstName;

  DocumentUploadState copyWith({
    final bool isLoading,
    final Widget snackBar,
    final AutovalidateMode autovalidateMode,
    final Document selectedDoc,
    final PickedFile photoFile,
    final String firstName,
    final bool clearOverlays = false,
  }) {
    return DocumentUploadState(
      isLoading: isLoading ?? this.isLoading,
      snackBar: clearOverlays ? null : snackBar ?? this.snackBar,
      autovalidateMode: autovalidateMode ?? this.autovalidateMode,
      selectedDoc: selectedDoc ?? this.selectedDoc,
      photoFile: photoFile ?? this.photoFile,
      firstName: firstName ?? this.firstName,
    );
  }

  DocumentUploadState error(String message) {
    return this.copyWith(
      isLoading: false,
      snackBar: AppSnackBar.error(message),
    );
  }

  @override
  List<Object> get props => [
        firstName,
        photoFile,
        selectedDoc,
        autovalidateMode,
        isLoading,
        snackBar,
        selectedDoc,
      ];
}
