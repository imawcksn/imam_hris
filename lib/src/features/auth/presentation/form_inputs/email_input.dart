import 'package:formz/formz.dart';
import 'package:imam_very_good_map/src/features/auth/domain/value_objects/user_email.dart';

enum EmailInputError { empty, invalid }

class EmailInput extends FormzInput<String, EmailInputError> {
  const EmailInput.pure() : super.pure('');
  const EmailInput.dirty([super.value = '']) : super.dirty();

  @override
  EmailInputError? validator(String value) {
    if (value.isEmpty) return EmailInputError.empty;
    final userEmail = UserEmail.create(value);
    return userEmail.fold(
      (l) => EmailInputError.invalid,
      (r) => null,
    );
  }
}
