part of 'login_bloc.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState(
      {required UsernameInput username,
      required PasswordInput password,
      required FormzSubmissionStatus submissionStatus,
      required bool isValid,
      String? errorMessage}) = _LoginState;

  factory LoginState.initial() => const LoginState(
        username: UsernameInput.pure(),
        password: PasswordInput.pure(),
        isValid: false,
        submissionStatus: FormzSubmissionStatus.initial,
      );
}
