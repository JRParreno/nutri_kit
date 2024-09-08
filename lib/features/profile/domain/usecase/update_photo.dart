import 'package:fpdart/fpdart.dart';
import 'package:nutri_kit/core/error/failure.dart';
import 'package:nutri_kit/core/usecase/usecase.dart';
import 'package:nutri_kit/features/profile/domain/repository/profile_repository.dart';

class UpdatePhoto implements UseCase<String, UpdatePhotoParams> {
  final ProfileRepository profileRepository;

  const UpdatePhoto(this.profileRepository);

  @override
  Future<Either<Failure, String>> call(UpdatePhotoParams params) async {
    return await profileRepository.updatePhoto(
      path: params.path,
      pk: params.pk,
    );
  }
}

class UpdatePhotoParams {
  final String path;
  final String pk;

  const UpdatePhotoParams({
    required this.path,
    required this.pk,
  });
}
