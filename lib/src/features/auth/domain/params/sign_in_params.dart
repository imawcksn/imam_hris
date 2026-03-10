import 'package:imam_very_good_map/src/features/auth/domain/value_objects/user_email.dart';

class SignInParams {
  SignInParams({required this.email, required this.password});

  final UserEmail email;
  final String password;
}
