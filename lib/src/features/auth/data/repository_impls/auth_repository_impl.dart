import 'package:fpdart/fpdart.dart';
import 'package:imam_very_good_map/core/errors/exception/api_exception.dart';
import 'package:imam_very_good_map/core/errors/failure/failure.dart';
import 'package:imam_very_good_map/core/typedefs/typedefs.dart';
import 'package:imam_very_good_map/src/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:imam_very_good_map/src/features/auth/data/models/user_model.dart';
import 'package:imam_very_good_map/src/features/auth/domain/entities/user.dart';
import 'package:imam_very_good_map/src/features/auth/domain/params/sign_in_params.dart';
import 'package:imam_very_good_map/src/features/auth/domain/params/sign_up_params.dart';
import 'package:imam_very_good_map/src/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required AuthRemoteDatasource authRemoteDatasource})
      : _authRemoteDatasource = authRemoteDatasource;

  final AuthRemoteDatasource _authRemoteDatasource;
  @override
  Future<FailureOr<User>> signIn(SignInParams params) async {
    try {
      final user = await _authRemoteDatasource.signIn(
        params.email.value,
        params.password,
      );

      return Right(user.toUser());
    } on ApiException catch (e) {
      return Left(Failure(e.message));
    } catch (e) {
      return const Left(Failure('Unexpected error'));
    }
  }

  @override
  Future<FailureOr<User>> signUp(SignUpParams params) async {
    try {
      final user = await _authRemoteDatasource.signUp(
        params.email.value,
        params.password,
        params.name,
      );

      return Right(user.toUser());
    } on ApiException catch (e) {
      return Left(Failure(e.message));
    } catch (e) {
      return const Left(Failure('Unexpected error'));
    }
  }
}
