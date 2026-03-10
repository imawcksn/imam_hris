import 'package:imam_very_good_map/src/features/auth/domain/value_objects/user_email.dart';

class SignUpParams {
  SignUpParams({
    required this.email,
    required this.password,
    required this.name,
  });

  final UserEmail email;
  final String password;
  final String name;
}
