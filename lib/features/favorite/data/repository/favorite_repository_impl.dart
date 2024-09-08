import 'package:fpdart/fpdart.dart';
import 'package:nutri_kit/core/error/exceptions.dart';
import 'package:nutri_kit/core/error/failure.dart';
import 'package:nutri_kit/features/favorite/data/datasource/favorite_remote_data_source.dart';
import 'package:nutri_kit/features/favorite/domain/repository/favorite_repository.dart';
import 'package:nutri_kit/features/search/domain/entities/index.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final FavoriteRemoteDataSource favoriteRemoteDataSource;

  const FavoriteRepositoryImpl(this.favoriteRemoteDataSource);

  @override
  Future<Either<Failure, DeficiencySearchResponseEntity>>
      getListFavoriteDeficiency({String? next, String? previous}) async {
    try {
      final response = await favoriteRemoteDataSource.getListFavoriteDeficiency(
        next: next,
        previous: previous,
      );

      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, RemediesResponseEntity>> getListFavoriteRemedy(
      {String? next, String? previous}) async {
    try {
      final response = await favoriteRemoteDataSource.getListFavoriteRemedy(
        next: next,
        previous: previous,
      );

      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, FoodResponseEntity>> getListFavoriteFood(
      {String? next, String? previous}) async {
    try {
      final response = await favoriteRemoteDataSource.getListFavoriteFood(
        next: next,
        previous: previous,
      );

      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, VitaminResponseEntity>> getListFavoriteVitamin(
      {String? next, String? previous}) async {
    try {
      final response = await favoriteRemoteDataSource.getListFavoriteVitamin(
        next: next,
        previous: previous,
      );

      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
