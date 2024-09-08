import 'package:fpdart/fpdart.dart';
import 'package:nutri_kit/core/error/exceptions.dart';
import 'package:nutri_kit/core/error/failure.dart';
import 'package:nutri_kit/features/meal/data/datasources/meal_remote_data_source.dart';
import 'package:nutri_kit/features/meal/domain/entities/user_meal_plan_creation_entity.dart';
import 'package:nutri_kit/features/meal/domain/entities/user_meal_plan_detail_entity.dart';
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
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserMealPlanCreationEntity>> createChildHealthForm({
    required String birthdate,
    required String height,
    required String weight,
    required String gender,
    required String name,
  }) async {
    try {
      final response = await mealRemoteDataSource.createChildHealthForm(
        birthdate: birthdate,
        gender: gender,
        height: height,
        name: name,
        weight: weight,
      );
      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserMealPlanDetailEntity>> getChildMealPlanDetail({
    required String userMealPlanId,
    required String mealPlanId,
  }) async {
    try {
      final response = await mealRemoteDataSource.getChildMealPlanDetail(
        mealPlanId: mealPlanId,
        userMealPlanId: userMealPlanId,
      );
      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> updateDayMealCompletionComplete(
      {required int id, required bool isCompleted}) async {
    try {
      final response =
          await mealRemoteDataSource.updateDayMealCompletionComplete(
        id: id,
        isCompleted: isCompleted,
      );
      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> deleteUserMealPlan(int id) async {
    try {
      final response = await mealRemoteDataSource.deleteUserMealPlan(id);
      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
