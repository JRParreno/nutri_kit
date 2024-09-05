import 'package:fpdart/fpdart.dart';
import 'package:nutri_kit/core/error/failure.dart';
import 'package:nutri_kit/features/meal/domain/entities/index.dart';

abstract interface class MealRepository {
  Future<Either<Failure, UserMealPlanResponseEntity>> getChildList({
    String? next,
    String? previous,
  });
  Future<Either<Failure, UserMealPlanCreationEntity>> createChildHealthForm({
    required String birthdate,
    required String height,
    required String weight,
    required String gender,
    required String name,
  });
  Future<Either<Failure, UserMealPlanDetailEntity>> getChildMealPlanDetail({
    required String userMealPlanId,
    required String mealPlanId,
  });
  Future<Either<Failure, String>> updateDayMealCompletionComplete({
    required int id,
    required bool isCompleted,
  });
}
