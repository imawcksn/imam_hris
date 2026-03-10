import 'package:formz/formz.dart';

enum UsernameInputError { empty }

class UsernameInput extends FormzInput<String, UsernameInputError> {
  const UsernameInput.pure() : super.pure('');
  const UsernameInput.dirty([super.value = '']) : super.dirty();

  @override
  UsernameInputError? validator(String value) {
    return value.isEmpty ? UsernameInputError.empty : null;
  }
}
