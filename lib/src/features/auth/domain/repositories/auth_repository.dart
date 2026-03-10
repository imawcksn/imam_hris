import 'package:imam_very_good_map/core/typedefs/typedefs.dart';
import 'package:imam_very_good_map/src/features/auth/domain/entities/user.dart';
import 'package:imam_very_good_map/src/features/auth/domain/params/sign_in_params.dart';
import 'package:imam_very_good_map/src/features/auth/domain/params/sign_up_params.dart';

abstract interface class AuthRepository {
  Future<FailureOr<User>> signIn(SignInParams params);
  Future<FailureOr<User>> signUp(SignUpParams params);
}
