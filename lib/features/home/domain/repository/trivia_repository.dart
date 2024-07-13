import 'package:fpdart/fpdart.dart';
import 'package:nutri_kit/core/error/failure.dart';
import 'package:nutri_kit/features/home/domain/entities/index.dart';

abstract interface class TriviaRepository {
  Future<Either<Failure, TriviaResponse>> getListTrivia({
    String? next,
    String? previous,
  });
  Future<Either<Failure, Trivia>> getDetailTrivia(int id);
}
