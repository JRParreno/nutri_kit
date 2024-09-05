import 'package:fpdart/fpdart.dart';
import 'package:nutri_kit/core/error/failure.dart';
import 'package:nutri_kit/core/usecase/usecase.dart';
import 'package:nutri_kit/features/remedy/domain/repository/remedy_repository.dart';

class DeleteFavoriteRemedy
    implements UseCase<String, DeleteFavoriteRemedyParams> {
  final RemedyRepository remedyRepository;

  const DeleteFavoriteRemedy(this.remedyRepository);

  @override
  Future<Either<Failure, String>> call(
      DeleteFavoriteRemedyParams params) async {
    return await remedyRepository.deleteFavoriteRemedy(params.id);
  }
}

class DeleteFavoriteRemedyParams {
  final int id;

  const DeleteFavoriteRemedyParams(this.id);
}
