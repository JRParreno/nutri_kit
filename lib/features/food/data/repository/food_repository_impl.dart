import 'package:fpdart/fpdart.dart';
import 'package:nutri_kit/core/error/exceptions.dart';
import 'package:nutri_kit/core/error/failure.dart';
import 'package:nutri_kit/features/food/data/datasources/food_remote_data_source.dart';
import 'package:nutri_kit/features/food/domain/entities/food_entity.dart';
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
}
