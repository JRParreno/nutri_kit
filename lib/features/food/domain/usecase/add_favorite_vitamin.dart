import 'package:fpdart/fpdart.dart';
import 'package:nutri_kit/core/error/failure.dart';
import 'package:nutri_kit/core/usecase/usecase.dart';
import 'package:nutri_kit/features/food/domain/repository/food_repository.dart';

class AddFavoriteVitamin implements UseCase<String, AddFavoriteVitaminParams> {
  final FoodRepository foodRepository;

  const AddFavoriteVitamin(this.foodRepository);

  @override
  Future<Either<Failure, String>> call(AddFavoriteVitaminParams params) async {
    return await foodRepository.addFavoriteVitamin(params.id);
  }
}

class AddFavoriteVitaminParams {
  final int id;

  const AddFavoriteVitaminParams(this.id);
}
