import 'package:fpdart/fpdart.dart';
import 'package:nutri_kit/core/common/entities/user.dart';
import 'package:nutri_kit/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:nutri_kit/features/auth/domain/entities/login_response.dart';
import 'package:nutri_kit/features/auth/domain/entities/signup_response.dart';
import 'package:nutri_kit/features/auth/domain/repository/auth_repository.dart';
import 'package:nutri_kit/core/error/exceptions.dart';
import 'package:nutri_kit/core/error/failure.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, LoginResponse>> loginWithEmailPassword(
      {required String email, required String password}) async {
    try {
      final response = await remoteDataSource.loginWithEmailPassword(
        email: email,
        password: password,
      );

      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, SingupResponse>> signup(
      {required String email,
      required String firstName,
      required String lastName,
      required String password,
      required String confirmPassword}) async {
    try {
      final response = await remoteDataSource.signup(
        email: email,
        firstName: firstName,
        lastName: lastName,
        password: password,
        confirmPassword: confirmPassword,
      );
      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, User>> currentUser() async {
    try {
      final response = await remoteDataSource.currentUser();
      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
