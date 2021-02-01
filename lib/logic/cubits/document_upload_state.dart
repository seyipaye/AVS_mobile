part of 'document_upload_cubit.dart';

class DocumentUploadState extends Equatable {
  DocumentUploadState({
    this.firstName,
    this.photoFile,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.isLoading = false,
    this.showCompletionDialog = false,
    this.errorMessage,
    this.selectedDoc,
  }) {
    //print(firstName);
  }

  final bool showCompletionDialog;
  final bool isLoading;
  final String errorMessage;
  final AutovalidateMode autovalidateMode;
  final Document selectedDoc;
  final PickedFile photoFile;
  final String firstName;

  bool get hasError => errorMessage != null && errorMessage != '';

  DocumentUploadState copyWith({
    final bool showCompletionDialog,
    final bool isLoading,
    final String errorMessage,
    final AutovalidateMode autovalidateMode,
    final Document selectedDoc,
    final PickedFile photoFile,
    final String firstName,
  }) {
    return DocumentUploadState(
      showCompletionDialog: showCompletionDialog ?? this.showCompletionDialog,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      autovalidateMode: autovalidateMode ?? this.autovalidateMode,
      selectedDoc: selectedDoc ?? this.selectedDoc,
      photoFile: photoFile ?? this.photoFile,
      firstName: firstName ?? this.firstName,
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [
        firstName,
        photoFile,
        selectedDoc,
        autovalidateMode,
        isLoading,
        errorMessage,
        showCompletionDialog,
        selectedDoc,
      ];
}
