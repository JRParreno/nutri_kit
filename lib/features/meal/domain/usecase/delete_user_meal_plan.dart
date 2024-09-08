import 'package:fpdart/fpdart.dart';
import 'package:nutri_kit/core/error/failure.dart';
import 'package:nutri_kit/core/usecase/usecase.dart';
import 'package:nutri_kit/features/meal/domain/repository/meal_repository.dart';

class DeleteUserMealPlan implements UseCase<String, DeleteUserMealPlanParams> {
  final MealRepository mealRepository;

  const DeleteUserMealPlan(this.mealRepository);

  @override
  Future<Either<Failure, String>> call(DeleteUserMealPlanParams params) async {
    return await mealRepository.deleteUserMealPlan(params.id);
  }
}

class DeleteUserMealPlanParams {
  final int id;

  DeleteUserMealPlanParams(this.id);
}
