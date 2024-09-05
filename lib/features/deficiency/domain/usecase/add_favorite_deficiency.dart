import 'package:fpdart/fpdart.dart';
import 'package:nutri_kit/core/error/failure.dart';
import 'package:nutri_kit/core/usecase/usecase.dart';
import 'package:nutri_kit/features/deficiency/domain/repository/deficiency_repository.dart';

class AddFavoriteDeficiency
    implements UseCase<String, AddFavoriteDeficiencyParams> {
  final DeficiencyRepository deficiencyRepository;

  const AddFavoriteDeficiency(this.deficiencyRepository);

  @override
  Future<Either<Failure, String>> call(
      AddFavoriteDeficiencyParams params) async {
    return await deficiencyRepository.addFavoriteDeficiency(params.id);
  }
}

class AddFavoriteDeficiencyParams {
  final int id;

  const AddFavoriteDeficiencyParams(this.id);
}
