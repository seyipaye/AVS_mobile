part of 'document_upload_cubit.dart';

class DocumentUploadState extends Equatable {
  DocumentUploadState({
    this.autovalidateMode = AutovalidateMode.disabled,
    this.isLoading = false,
    this.showCompletionDialog = false,
    this.errorMessage,
    this.selectedDoc,
  });

  factory DocumentUploadState.error(String message) => DocumentUploadState(
        isLoading: false,
        errorMessage: message,
      );

  final bool showCompletionDialog;
  final bool isLoading;
  final String errorMessage;
  final AutovalidateMode autovalidateMode;
  final Document selectedDoc;

  bool get hasError => errorMessage != null;

  DocumentUploadState copyWith({
    final bool showCompletionDialog,
    final bool isLoading,
    final AutovalidateMode autovalidateMode,
    final Document selectedDoc,
  }) {
    return DocumentUploadState(
      showCompletionDialog: showCompletionDialog ?? this.showCompletionDialog,
      isLoading: isLoading ?? this.isLoading,
      autovalidateMode: autovalidateMode ?? this.autovalidateMode,
      selectedDoc: selectedDoc ?? this.selectedDoc,
    );
  }

  @override
  // TODO: implement props
  List<Object> get props =>
      [selectedDoc, autovalidateMode, isLoading, errorMessage];
}
