import 'package:fpdart/fpdart.dart';
import 'package:nutri_kit/core/error/failure.dart';
import 'package:nutri_kit/features/search/domain/entities/index.dart';

abstract interface class SearchRepository {
  Future<Either<Failure, RemediesResponseEntity>> searchRemedies({
    required String keyword,
    String? next,
    String? previous,
  });
  Future<Either<Failure, DeficiencySearchResponseEntity>> searchDeficiencies({
    required String keyword,
    String? next,
    String? previous,
  });
  Future<Either<Failure, FoodResponseEntity>> searchFoods({
    required String keyword,
    String? next,
    String? previous,
  });
  Future<Either<Failure, VitaminResponseEntity>> searchVitamins({
    required String keyword,
    String? next,
    String? previous,
  });
}
