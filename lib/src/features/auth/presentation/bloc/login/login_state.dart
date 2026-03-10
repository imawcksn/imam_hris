part of 'login_bloc.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    required EmailInput email,
    required PasswordInput password,
    required FormzSubmissionStatus submissionStatus,
    required bool obscurePassword,
    String? errorMessage,
  }) = _LoginState;

  factory LoginState.initial() => const LoginState(
        email: EmailInput.pure(),
        password: PasswordInput.pure(),
        submissionStatus: FormzSubmissionStatus.initial,
        obscurePassword: true,
      );
}

extension LoginStateX on LoginState {
  bool get isValid => Formz.validate([email, password]);
}
