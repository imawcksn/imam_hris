import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:imam_very_good_map/src/features/auth/domain/entities/user.dart';
import 'package:imam_very_good_map/src/features/auth/domain/value_objects/user_role.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String name,
    required String role,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

extension UserModelX on UserModel {
  User toUser() {
    return User(name: name, role: UserRole.fromString(role));
  }
}
