import 'package:fpdart/fpdart.dart';
import 'package:nutri_kit/core/error/failure.dart';
import 'package:nutri_kit/core/usecase/usecase.dart';
import 'package:nutri_kit/features/remedy/domain/repository/remedy_repository.dart';

class AddFavoriteRemedy implements UseCase<String, AddFavoriteRemedyParams> {
  final RemedyRepository remedyRepository;

  const AddFavoriteRemedy(this.remedyRepository);

  @override
  Future<Either<Failure, String>> call(AddFavoriteRemedyParams params) async {
    return await remedyRepository.addFavoriteRemedy(params.id);
  }
}

class AddFavoriteRemedyParams {
  final int id;

  const AddFavoriteRemedyParams(this.id);
}
