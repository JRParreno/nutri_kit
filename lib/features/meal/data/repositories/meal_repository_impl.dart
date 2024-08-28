import 'package:fpdart/fpdart.dart';
import 'package:nutri_kit/core/error/exceptions.dart';
import 'package:nutri_kit/core/error/failure.dart';
import 'package:nutri_kit/features/meal/data/datasources/meal_remote_data_source.dart';
import 'package:nutri_kit/features/meal/domain/entities/user_meal_plan_creation_entity.dart';
import 'package:nutri_kit/features/meal/domain/entities/user_meal_plan_response_entity.dart';
import 'package:nutri_kit/features/meal/domain/repository/meal_repository.dart';

class MealRepositoryImpl implements MealRepository {
  final MealRemoteDataSource mealRemoteDataSource;

  const MealRepositoryImpl(this.mealRemoteDataSource);

  @override
  Future<Either<Failure, UserMealPlanResponseEntity>> getChildList({
    String? next,
    String? previous,
  }) async {
    try {
      final response = await mealRemoteDataSource.getChildList(
        previous: previous,
        next: next,
      );
      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserMealPlanCreationEntity>> createChildHealthForm({
    required String birthdate,
    required String height,
    required String weight,
    required String gender,
    required String healthStatus,
    required String name,
  }) async {
    try {
      final response = await mealRemoteDataSource.createChildHealthForm(
        birthdate: birthdate,
        gender: gender,
        healthStatus: healthStatus,
        height: height,
        name: name,
        weight: weight,
      );
      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
