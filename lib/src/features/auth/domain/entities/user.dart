import 'package:equatable/equatable.dart';
import 'package:imam_very_good_map/src/features/auth/domain/value_objects/user_role.dart';

class User extends Equatable {
  const User({required this.name, required this.role});

  final String name;
  final UserRole role;

  @override
  List<Object?> get props => [name, role];

  @override
  bool get stringify => true;
}
