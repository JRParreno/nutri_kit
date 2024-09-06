import 'package:fpdart/fpdart.dart';
import 'package:nutri_kit/core/error/failure.dart';
import 'package:nutri_kit/core/usecase/usecase.dart';
import 'package:nutri_kit/features/food/domain/repository/food_repository.dart';

class AddFavoriteFood implements UseCase<String, AddFavoriteFoodParams> {
  final FoodRepository foodRepository;

  const AddFavoriteFood(this.foodRepository);

  @override
  Future<Either<Failure, String>> call(AddFavoriteFoodParams params) async {
    return await foodRepository.addFavoriteFood(params.id);
  }
}

class AddFavoriteFoodParams {
  final int id;

  const AddFavoriteFoodParams(this.id);
}
