import 'package:get_it/get_it.dart';
import 'package:imam_very_good_map/src/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:imam_very_good_map/src/features/auth/data/datasources/auth_remote_datasource_impl.dart';
import 'package:imam_very_good_map/src/features/auth/data/repository_impls/auth_repository_impl.dart';
import 'package:imam_very_good_map/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:imam_very_good_map/src/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:imam_very_good_map/src/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:imam_very_good_map/src/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final getIt = GetIt.instance;

Future<void> setupInjector() async {
  getIt
    // Auth
    ..registerLazySingleton<SupabaseClient>(
      () => Supabase.instance.client,
    )
    ..registerLazySingleton<AuthRemoteDatasource>(
      () => AuthRemoteDatasourceImpl(supabaseClient: getIt()),
    )
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(authRemoteDatasource: getIt()),
    )
    ..registerLazySingleton<SignInUsecase>(
      () => SignInUsecase(authRepository: getIt()),
    )
    ..registerLazySingleton<SignUpUsecase>(
      () => SignUpUsecase(authRepository: getIt()),
    )
    ..registerFactory<LoginBloc>(
      () => LoginBloc(getIt()),
    );
}
