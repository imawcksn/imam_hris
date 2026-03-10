
import 'package:imam_very_good_map/src/features/auth/data/models/user_model.dart';

abstract interface class AuthRemoteDatasource {
  Future<UserModel> signUp(String email, String password, String name);
  Future<UserModel> signIn(String email, String password);
}
