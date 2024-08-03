import 'package:fpdart/fpdart.dart';
import 'package:nutri_kit/core/error/failure.dart';
import 'package:nutri_kit/core/usecase/usecase.dart';
import 'package:nutri_kit/features/food/domain/entities/index.dart';
import 'package:nutri_kit/features/food/domain/repository/food_repository.dart';

class GetFoodDetail implements UseCase<FoodEntity, GetFoodDetailParams> {
  final FoodRepository foodRepository;

  const GetFoodDetail(this.foodRepository);

  @override
  Future<Either<Failure, FoodEntity>> call(GetFoodDetailParams params) async {
    return await foodRepository.getFoodDetail(params.id);
  }
}

class GetFoodDetailParams {
  final String id;
  const GetFoodDetailParams(this.id);
}
