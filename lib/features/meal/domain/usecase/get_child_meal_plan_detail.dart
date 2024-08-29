import 'package:fpdart/fpdart.dart';
import 'package:nutri_kit/core/error/failure.dart';
import 'package:nutri_kit/core/usecase/usecase.dart';
import 'package:nutri_kit/features/meal/domain/entities/index.dart';
import 'package:nutri_kit/features/meal/domain/repository/meal_repository.dart';

class GetChildMealPlanDetail
    implements UseCase<UserMealPlanDetailEntity, GetChildMealPlanDetailParams> {
  final MealRepository mealRepository;

  const GetChildMealPlanDetail(this.mealRepository);

  @override
  Future<Either<Failure, UserMealPlanDetailEntity>> call(
      GetChildMealPlanDetailParams params) async {
    return await mealRepository.getChildMealPlanDetail(
      mealPlanId: params.mealPlanId,
      userMealPlanId: params.userMealPlanId,
    );
  }
}

class GetChildMealPlanDetailParams {
  final String userMealPlanId;
  final String mealPlanId;

  GetChildMealPlanDetailParams({
    required this.mealPlanId,
    required this.userMealPlanId,
  });
}
