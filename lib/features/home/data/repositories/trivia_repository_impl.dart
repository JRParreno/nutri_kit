import 'package:fpdart/fpdart.dart';
import 'package:nutri_kit/core/error/exceptions.dart';
import 'package:nutri_kit/core/error/failure.dart';
import 'package:nutri_kit/features/home/data/datasources/trivia_remote_data_source.dart';
import 'package:nutri_kit/features/home/domain/entities/index.dart';
import 'package:nutri_kit/features/home/domain/repository/trivia_repository.dart';

class TriviaRepositoryImpl implements TriviaRepository {
  final TriviaRemoteDataSource triviaRemoteDataSource;

  const TriviaRepositoryImpl(this.triviaRemoteDataSource);

  @override
  Future<Either<Failure, Trivia>> getDetailTrivia(int id) async {
    try {
      final response = await triviaRemoteDataSource.getDetailTrivia(id);

      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, TriviaResponse>> getListTrivia() async {
    try {
      final response = await triviaRemoteDataSource.getListTrivia();

      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
