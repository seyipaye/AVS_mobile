part of 'user_info_cubit.dart';

class UserInfoState extends Equatable {
  UserInfoState({
    this.autovalidateMode = AutovalidateMode.disabled,
    this.isLoading = false,
    this.errorMessage,
  });

  factory UserInfoState.error(String message) => UserInfoState(
        isLoading: false,
        errorMessage: message,
      );

  final bool isLoading;
  final String errorMessage;
  final AutovalidateMode autovalidateMode;

  bool get hasError => errorMessage != null;

  UserInfoState copyWith({
    final bool hidePassword,
    final AutovalidateMode autovalidateMode,
    final bool isLoading,
  }) {
    return UserInfoState(
      autovalidateMode: autovalidateMode ?? this.autovalidateMode,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [autovalidateMode, isLoading, errorMessage];
}
