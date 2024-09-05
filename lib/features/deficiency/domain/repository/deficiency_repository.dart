import 'package:fpdart/fpdart.dart';
import 'package:nutri_kit/core/error/failure.dart';
import 'package:nutri_kit/features/deficiency/domain/entities/index.dart';

abstract interface class DeficiencyRepository {
  Future<Either<Failure, DeficiencyDetailEntity>> getDeficiencyDetail(
      String id);
  Future<Either<Failure, String>> addFavoriteDeficiency(int id);
  Future<Either<Failure, String>> deleteFavoriteDeficiency(int id);
}
