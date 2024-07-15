import 'package:fpdart/fpdart.dart';
import 'package:nutri_kit/core/error/exceptions.dart';
import 'package:nutri_kit/core/error/failure.dart';
import 'package:nutri_kit/features/search/data/datasources/search_remote_data_source.dart';
import 'package:nutri_kit/features/search/domain/entities/deficiency_response.dart';
import 'package:nutri_kit/features/search/domain/entities/food_response.dart';
import 'package:nutri_kit/features/search/domain/entities/remedies_response.dart';
import 'package:nutri_kit/features/search/domain/repository/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchRemoteDataSource searchRemoteDataSource;

  const SearchRepositoryImpl(this.searchRemoteDataSource);

  @override
  Future<Either<Failure, DeficiencyResponse>> searchDeficiencies({
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
  Future<Either<Failure, FoodResponse>> searchFoods({
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
  Future<Either<Failure, RemediesResponse>> searchRemedies({
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
}
