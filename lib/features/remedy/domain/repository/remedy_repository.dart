import 'package:fpdart/fpdart.dart';
import 'package:nutri_kit/core/error/failure.dart';
import 'package:nutri_kit/features/remedy/domain/entities/index.dart';

abstract interface class RemedyRepository {
  Future<Either<Failure, RemedyDetailEntity>> getRemedyDetail(String id);
  Future<Either<Failure, String>> addFavoriteRemedy(int id);
  Future<Either<Failure, String>> deleteFavoriteRemedy(int id);
}
