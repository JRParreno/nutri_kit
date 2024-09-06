import 'package:fpdart/fpdart.dart';
import 'package:nutri_kit/core/error/failure.dart';
import 'package:nutri_kit/features/food/domain/entities/index.dart';

abstract interface class FoodRepository {
  Future<Either<Failure, FoodEntity>> getFoodDetail(String id);
  Future<Either<Failure, VitaminEntity>> getVitaminDetail(String id);
  Future<Either<Failure, String>> addFavoriteFood(int id);
  Future<Either<Failure, String>> deleteFavoriteFood(int id);
  Future<Either<Failure, String>> addFavoriteVitamin(int id);
  Future<Either<Failure, String>> deleteFavoriteVitamin(int id);
}
