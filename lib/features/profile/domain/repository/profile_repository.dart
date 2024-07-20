import 'package:fpdart/fpdart.dart';
import 'package:nutri_kit/core/common/entities/user.dart';
import 'package:nutri_kit/core/error/failure.dart';

abstract interface class ProfileRepository {
  Future<Either<Failure, User>> updateProfile({
    required String firstName,
    required String lastName,
    required String email,
  });
}
