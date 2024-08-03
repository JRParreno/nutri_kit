import 'package:fpdart/fpdart.dart';
import 'package:nutri_kit/core/error/failure.dart';
import 'package:nutri_kit/features/food/domain/entities/index.dart';

abstract interface class FoodRepository {
  Future<Either<Failure, FoodEntity>> getFoodDetail(String id);
}
