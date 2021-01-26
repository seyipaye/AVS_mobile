part of 'user_info_cubit.dart';

class UserInfoState extends Equatable {
  UserInfoState({
    this.autovalidateMode = AutovalidateMode.disabled,
    this.isLoading = false,
    this.showCompletionDialog = false,
    this.errorMessage,
  });

  factory UserInfoState.error(String message) => UserInfoState(
        isLoading: false,
        errorMessage: message,
      );

  final bool showCompletionDialog;
  final bool isLoading;
  final String errorMessage;
  final AutovalidateMode autovalidateMode;

  bool get hasError => errorMessage != null;

  UserInfoState copyWith({
    final bool showCompletionDialog,
    final bool isLoading,
    final AutovalidateMode autovalidateMode,
  }) {
    return UserInfoState(
      showCompletionDialog: showCompletionDialog ?? this.showCompletionDialog,
      isLoading: isLoading ?? this.isLoading,
      autovalidateMode: autovalidateMode ?? this.autovalidateMode,
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [autovalidateMode, isLoading, errorMessage];
}
