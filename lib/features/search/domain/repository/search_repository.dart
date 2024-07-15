import 'package:fpdart/fpdart.dart';
import 'package:nutri_kit/core/error/failure.dart';
import 'package:nutri_kit/features/search/domain/entities/index.dart';

abstract interface class SearchRepository {
  Future<Either<Failure, RemediesResponse>> searchRemedies({
    required String keyword,
    String? next,
    String? previous,
  });
  Future<Either<Failure, DeficiencyResponse>> searchDeficiencies({
    required String keyword,
    String? next,
    String? previous,
  });
  Future<Either<Failure, FoodResponse>> searchFoods({
    required String keyword,
    String? next,
    String? previous,
  });
}
