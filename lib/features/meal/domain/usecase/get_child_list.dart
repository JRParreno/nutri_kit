import 'package:fpdart/fpdart.dart';
import 'package:nutri_kit/core/error/failure.dart';
import 'package:nutri_kit/core/usecase/usecase.dart';
import 'package:nutri_kit/features/meal/domain/entities/index.dart';
import 'package:nutri_kit/features/meal/domain/repository/meal_repository.dart';

class GetChildList
    implements UseCase<UserMealPlanResponseEntity, GetChildListParams> {
  final MealRepository mealRepository;

  const GetChildList(this.mealRepository);

  @override
  Future<Either<Failure, UserMealPlanResponseEntity>> call(
      GetChildListParams params) async {
    return await mealRepository.getChildList(
      previous: params.previous,
      next: params.next,
    );
  }
}

class GetChildListParams {
  final String? next;
  final String? previous;

  GetChildListParams({
    this.next,
    this.previous,
  });
}
