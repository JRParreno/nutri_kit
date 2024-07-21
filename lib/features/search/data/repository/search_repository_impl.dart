import 'package:fpdart/fpdart.dart';
import 'package:nutri_kit/core/error/exceptions.dart';
import 'package:nutri_kit/core/error/failure.dart';
import 'package:nutri_kit/features/search/data/datasources/search_remote_data_source.dart';
import 'package:nutri_kit/features/search/domain/entities/index.dart';
import 'package:nutri_kit/features/search/domain/repository/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchRemoteDataSource searchRemoteDataSource;

  const SearchRepositoryImpl(this.searchRemoteDataSource);

  @override
  Future<Either<Failure, DeficiencyResponseEntity>> searchDeficiencies({
    required String keyword,
    String? next,
    String? previous,
  }) async {
    try {
      final response = await searchRemoteDataSource.searchDeficiencies(
        keyword: keyword,
        next: next,
        previous: previous,
      );

      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, FoodResponseEntity>> searchFoods({
    required String keyword,
    String? next,
    String? previous,
  }) async {
    try {
      final response = await searchRemoteDataSource.searchFoods(
        keyword: keyword,
        next: next,
        previous: previous,
      );

      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, RemediesResponseEntity>> searchRemedies({
    required String keyword,
    String? next,
    String? previous,
  }) async {
    try {
      final response = await searchRemoteDataSource.searchRemedies(
        keyword: keyword,
        next: next,
        previous: previous,
      );

      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, VitaminResponseEntity>> searchVitamins({
    required String keyword,
    String? next,
    String? previous,
  }) async {
    try {
      final response = await searchRemoteDataSource.searchVitamins(
        keyword: keyword,
        next: next,
        previous: previous,
      );

      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
