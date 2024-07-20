import 'package:fpdart/fpdart.dart';
import 'package:nutri_kit/core/common/entities/user.dart';
import 'package:nutri_kit/core/error/failure.dart';
import 'package:nutri_kit/core/usecase/usecase.dart';
import 'package:nutri_kit/features/profile/domain/repository/profile_repository.dart';

class UpdateProfile implements UseCase<User, UpdateProfileParams> {
  final ProfileRepository profileRepository;

  const UpdateProfile(this.profileRepository);

  @override
  Future<Either<Failure, User>> call(UpdateProfileParams params) async {
    return await profileRepository.updateProfile(
      firstName: params.firstName,
      lastName: params.lastName,
      email: params.email,
    );
  }
}

class UpdateProfileParams {
  final String firstName;
  final String lastName;
  final String email;

  const UpdateProfileParams({
    required this.firstName,
    required this.lastName,
    required this.email,
  });
}
