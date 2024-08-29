import 'package:fpdart/fpdart.dart';
import 'package:nutri_kit/core/error/failure.dart';
import 'package:nutri_kit/core/usecase/usecase.dart';
import 'package:nutri_kit/features/meal/domain/repository/meal_repository.dart';

class UpdateDayMealCompletionComplete
    implements UseCase<String, UpdateDayMealCompletionCompleteParams> {
  final MealRepository mealRepository;

  const UpdateDayMealCompletionComplete(this.mealRepository);

  @override
  Future<Either<Failure, String>> call(
      UpdateDayMealCompletionCompleteParams params) async {
    return await mealRepository.updateDayMealCompletionComplete(
      id: params.id,
      isCompleted: params.isCompleted,
    );
  }
}

class UpdateDayMealCompletionCompleteParams {
  final int id;
  final bool isCompleted;

  UpdateDayMealCompletionCompleteParams({
    required this.id,
    required this.isCompleted,
  });
}
