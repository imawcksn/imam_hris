import 'package:equatable/equatable.dart';

class UserRole extends Equatable {
  factory UserRole.fromString(String? role) {
    switch (role?.toLowerCase()) {
      case 'employee':
        return employee;
      case 'admin':
        return admin;
      default:
        return unknown;
    }
  }
  const UserRole._(this.value);

  final String value;

  static const employee = UserRole._('employee');
  static const admin = UserRole._('admin');
  static const unknown = UserRole._('unknown');

  @override
  List<Object?> get props => [value];
}
