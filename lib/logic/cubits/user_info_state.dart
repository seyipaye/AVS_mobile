part of 'user_info_cubit.dart';

class UserInfoState extends Equatable {
  UserInfoState({
    this.autovalidateMode = AutovalidateMode.disabled,
    this.isLoading = false,
    this.showCompletionDialog = false,
    this.snackBar,
  });

  final bool showCompletionDialog;
  final bool isLoading;
  final Widget snackBar;
  final AutovalidateMode autovalidateMode;

  UserInfoState copyWith({
    final bool showCompletionDialog,
    final bool isLoading,
    final Widget snackBar,
    final AutovalidateMode autovalidateMode,
    final bool clearOverlays = false,
  }) {
    return UserInfoState(
      showCompletionDialog: showCompletionDialog ?? this.showCompletionDialog,
      isLoading: isLoading ?? this.isLoading,
      snackBar: clearOverlays ? null : snackBar ?? this.snackBar,
      autovalidateMode: autovalidateMode ?? this.autovalidateMode,
    );
  }

  UserInfoState error(String message) {
    return this.copyWith(
      isLoading: false,
      showCompletionDialog: false,
      snackBar: AppSnackBar.error(message),
    );
  }

  @override
  List<Object> get props => [autovalidateMode, isLoading, snackBar];
}
