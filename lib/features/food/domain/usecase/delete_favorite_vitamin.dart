import 'package:fpdart/fpdart.dart';
import 'package:nutri_kit/core/error/failure.dart';
import 'package:nutri_kit/core/usecase/usecase.dart';
import 'package:nutri_kit/features/food/domain/repository/food_repository.dart';

class DeleteFavoriteVitamin
    implements UseCase<String, DeleteFavoriteVitaminParams> {
  final FoodRepository foodRepository;

  const DeleteFavoriteVitamin(this.foodRepository);

  @override
  Future<Either<Failure, String>> call(
      DeleteFavoriteVitaminParams params) async {
    return await foodRepository.deleteFavoriteVitamin(params.id);
  }
}

class DeleteFavoriteVitaminParams {
  final int id;

  const DeleteFavoriteVitaminParams(this.id);
}
