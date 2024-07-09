import 'package:fpdart/fpdart.dart';
import 'package:nutri_kit/features/auth/domain/entities/login_response.dart';
import 'package:nutri_kit/core/error/failure.dart';
import 'package:nutri_kit/features/auth/domain/entities/signup_response.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, LoginResponse>> loginWithEmailPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, SingupResponse>> signup({
    required String email,
    required String firstName,
    required String lastName,
    required String password,
    required String confirmPassword,
  });
}
