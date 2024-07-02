import 'package:fpdart/fpdart.dart';
import 'package:nutri_kit/features/auth/domain/entities/login_response.dart';
import 'package:nutri_kit/core/error/failure.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, LoginResponse>> loginWithEmailPassword({
    required String email,
    required String password,
  });
}
