import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:imam_very_good_map/src/features/auth/domain/params/sign_in_params.dart';
import 'package:imam_very_good_map/src/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:imam_very_good_map/src/features/auth/domain/value_objects/user_email.dart';
import 'package:imam_very_good_map/src/features/auth/presentation/form_inputs/email_input.dart';
import 'package:imam_very_good_map/src/features/auth/presentation/form_inputs/password_input.dart';

part 'login_bloc.freezed.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this._signInUsecase) : super(LoginState.initial()) {
    on<_EmailChanged>(_onEmailChanged);
    on<_PasswordChanged>(_onPasswordChanged);
    on<_PasswordVisibilityToggled>(_onPasswordVisibilityToggled);
    on<_Submitted>(_onSubmitted);
  }
  final SignInUsecase _signInUsecase;
  void _onEmailChanged(
    _EmailChanged event,
    Emitter<LoginState> emit,
  ) {
    final email = EmailInput.dirty(event.email);

    emit(
      state.copyWith(
        email: email,
      ),
    );
  }

  void _onPasswordChanged(
    _PasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    final password = PasswordInput.dirty(event.password);
    emit(
      state.copyWith(
        password: password,
      ),
    );
  }

  void _onPasswordVisibilityToggled(
    _PasswordVisibilityToggled event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(obscurePassword: !state.obscurePassword));
  }

  Future<void> _onSubmitted(
    _Submitted event,
    Emitter<LoginState> emit,
  ) async {
    if (!state.isValid) return;

    final emailResult = UserEmail.create(state.email.value);

    await emailResult.fold(
      (failure) async {
        emit(state.copyWith(errorMessage: failure.message));
      },
      (email) async {
        final signInResult = await _signInUsecase.call(
          SignInParams(
            email: email,
            password: state.password.value,
          ),
        );

        signInResult.fold(
          (failure) => emit(state.copyWith(errorMessage: failure.message)),
          (_) => emit(LoginState.initial()),
        );
      },
    );
  }
}
