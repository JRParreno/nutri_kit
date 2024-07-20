import 'package:fpdart/fpdart.dart';
import 'package:nutri_kit/core/common/entities/user.dart';
import 'package:nutri_kit/core/error/exceptions.dart';
import 'package:nutri_kit/core/error/failure.dart';
import 'package:nutri_kit/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:nutri_kit/features/profile/domain/repository/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource profileRemoteDataSource;

  const ProfileRepositoryImpl(this.profileRemoteDataSource);

  @override
  Future<Either<Failure, User>> updateProfile({
    required String firstName,
    required String lastName,
    required String email,
  }) async {
    try {
      final response = await profileRemoteDataSource.updateProfile(
        firstName: firstName,
        lastName: lastName,
        email: email,
      );

      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
