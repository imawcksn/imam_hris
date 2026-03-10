import 'package:imam_very_good_map/core/errors/exception/api_exception.dart';
import 'package:imam_very_good_map/src/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:imam_very_good_map/src/features/auth/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  AuthRemoteDatasourceImpl({required SupabaseClient supabaseClient})
      : _supabaseClient = supabaseClient;

  final SupabaseClient _supabaseClient;
  @override
  Future<UserModel> signUp(String email, String password, String name) async {
    final response =
        await _supabaseClient.auth.signUp(email: email, password: password);

    final user = response.user;
    if (user == null) throw const ApiException('Signup failed');

    await _supabaseClient
        .from('users')
        .insert({'id': user.id, 'name': name, 'role': 'employee'});

    final data =
        await _supabaseClient.from('users').select().eq('id', user.id).single();

    return UserModel.fromJson(data);
  }

  @override
  Future<UserModel> signIn(String email, String password) async {
    final response = await _supabaseClient.auth
        .signInWithPassword(email: email, password: password);
    final user = response.user;
    if (user == null) throw const ApiException('Signin failed');

    final data =
        await _supabaseClient.from('users').select().eq('id', user.id).single();

    return UserModel.fromJson(data);
  }
}
