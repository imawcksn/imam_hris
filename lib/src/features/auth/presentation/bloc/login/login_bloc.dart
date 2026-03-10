import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:imam_very_good_map/src/features/auth/presentation/form_inputs/password_input.dart';
import 'package:imam_very_good_map/src/features/auth/presentation/form_inputs/username_input.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState.initial()) {
    on<_UsernameChanged>(_onUsernameChanged);
  }
  void _onUsernameChanged(
    _UsernameChanged event,
    Emitter<LoginState> emit,
  ) {
    final username = UsernameInput.dirty(event.username);

    emit(
      state.copyWith(
        username: username,
        isValid: Formz.validate([
          username,
          state.password,
        ]),
      ),
    );
  }
}
