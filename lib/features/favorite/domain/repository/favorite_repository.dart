import 'package:fpdart/fpdart.dart';
import 'package:nutri_kit/core/error/failure.dart';
import 'package:nutri_kit/features/search/domain/entities/index.dart';

abstract interface class FavoriteRepository {
  Future<Either<Failure, DeficiencySearchResponseEntity>>
      getListFavoriteDeficiency({
    String? next,
    String? previous,
  });
  Future<Either<Failure, RemediesResponseEntity>> getListFavoriteRemedy({
    String? next,
    String? previous,
  });
}
