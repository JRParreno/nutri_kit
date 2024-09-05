import 'package:fpdart/fpdart.dart';
import 'package:nutri_kit/core/error/failure.dart';
import 'package:nutri_kit/core/usecase/usecase.dart';
import 'package:nutri_kit/features/deficiency/domain/repository/deficiency_repository.dart';

class DeleteFavoriteDeficiency
    implements UseCase<String, DeleteFavoriteDeficiencyParams> {
  final DeficiencyRepository deficiencyRepository;

  const DeleteFavoriteDeficiency(this.deficiencyRepository);

  @override
  Future<Either<Failure, String>> call(
      DeleteFavoriteDeficiencyParams params) async {
    return await deficiencyRepository.deleteFavoriteDeficiency(params.id);
  }
}

class DeleteFavoriteDeficiencyParams {
  final int id;

  const DeleteFavoriteDeficiencyParams(this.id);
}
