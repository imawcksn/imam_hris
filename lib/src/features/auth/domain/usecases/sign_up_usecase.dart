import 'package:imam_very_good_map/core/typedefs/typedefs.dart';
import 'package:imam_very_good_map/core/types/usecase.dart';
import 'package:imam_very_good_map/src/features/auth/domain/entities/user.dart';
import 'package:imam_very_good_map/src/features/auth/domain/params/sign_up_params.dart';
import 'package:imam_very_good_map/src/features/auth/domain/repositories/auth_repository.dart';

class SignUpUsecase implements Usecase<FailureOr<User>, SignUpParams> {
  SignUpUsecase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  final AuthRepository _authRepository;

  @override
  Future<FailureOr<User>> call(SignUpParams params) {
    return _authRepository.signUp(params);
  }
}
