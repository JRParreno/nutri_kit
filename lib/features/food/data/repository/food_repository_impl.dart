import 'package:fpdart/fpdart.dart';
import 'package:nutri_kit/core/error/exceptions.dart';
import 'package:nutri_kit/core/error/failure.dart';
import 'package:nutri_kit/features/food/data/datasources/food_remote_data_source.dart';
import 'package:nutri_kit/features/food/domain/entities/food_entity.dart';
import 'package:nutri_kit/features/food/domain/entities/vitamin_entity.dart';
import 'package:nutri_kit/features/food/domain/repository/food_repository.dart';

class FoodRepositoryImpl implements FoodRepository {
  final FoodRemoteDataSource foodRemoteDataSource;

  const FoodRepositoryImpl(this.foodRemoteDataSource);

  @override
  Future<Either<Failure, FoodEntity>> getFoodDetail(String id) async {
    try {
      final response = await foodRemoteDataSource.getFoodDetail(id);
      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> addFavoriteFood(int id) async {
    try {
      final response = await foodRemoteDataSource.addFavoriteFood(id);

      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> addFavoriteVitamin(int id) async {
    try {
      final response = await foodRemoteDataSource.addFavoriteVitamin(id);

      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> deleteFavoriteFood(int id) async {
    try {
      final response = await foodRemoteDataSource.deleteFavoriteFood(id);

      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> deleteFavoriteVitamin(int id) async {
    try {
      final response = await foodRemoteDataSource.deleteFavoriteVitamin(id);

      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, VitaminEntity>> getVitaminDetail(String id) async {
    try {
      final response = await foodRemoteDataSource.getVitaminDetail(id);
      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
