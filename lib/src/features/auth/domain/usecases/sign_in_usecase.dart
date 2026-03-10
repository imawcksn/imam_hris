import 'package:imam_very_good_map/core/typedefs/typedefs.dart';
import 'package:imam_very_good_map/core/types/usecase.dart';
import 'package:imam_very_good_map/src/features/auth/domain/entities/user.dart';
import 'package:imam_very_good_map/src/features/auth/domain/params/sign_in_params.dart';
import 'package:imam_very_good_map/src/features/auth/domain/repositories/auth_repository.dart';

class SignInUsecase implements Usecase<FailureOr<User>, SignInParams> {
  SignInUsecase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  final AuthRepository _authRepository;
  @override
  Future<FailureOr<User>> call(SignInParams params) {
    return _authRepository.signIn(params);
  }
}
