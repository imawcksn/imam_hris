import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:imam_very_good_map/core/errors/failure/failure.dart';

class UserEmail extends Equatable {
  const UserEmail._(this.value);
  final String value;

  static final _regex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');

  static bool isValid(String input) => _regex.hasMatch(input);

  static Either<Failure, UserEmail> create(String input) {
    if (!isValid(input)) {
      return const Left(Failure('Invalid email'));
    }
    return Right(UserEmail._(input));
  }

  @override
  List<Object?> get props => [value];
}
