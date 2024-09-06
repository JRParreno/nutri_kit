import 'package:fpdart/fpdart.dart';
import 'package:nutri_kit/core/error/failure.dart';
import 'package:nutri_kit/core/usecase/usecase.dart';
import 'package:nutri_kit/features/food/domain/repository/food_repository.dart';

class DeleteFavoriteFood implements UseCase<String, DeleteFavoriteFoodParams> {
  final FoodRepository foodRepository;

  const DeleteFavoriteFood(this.foodRepository);

  @override
  Future<Either<Failure, String>> call(DeleteFavoriteFoodParams params) async {
    return await foodRepository.deleteFavoriteFood(params.id);
  }
}

class DeleteFavoriteFoodParams {
  final int id;

  const DeleteFavoriteFoodParams(this.id);
}
