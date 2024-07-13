import 'package:fpdart/fpdart.dart';
import 'package:nutri_kit/core/error/failure.dart';
import 'package:nutri_kit/core/usecase/usecase.dart';
import 'package:nutri_kit/features/home/domain/entities/index.dart';
import 'package:nutri_kit/features/home/domain/repository/trivia_repository.dart';

class GetTriviaList implements UseCase<TriviaResponse, GetTriviaListParams> {
  final TriviaRepository triviaRepository;

  const GetTriviaList(this.triviaRepository);

  @override
  Future<Either<Failure, TriviaResponse>> call(
      GetTriviaListParams params) async {
    return await triviaRepository.getListTrivia(
      next: params.next,
      previous: params.previous,
    );
  }
}

class GetTriviaListParams {
  final String? next;
  final String? previous;

  const GetTriviaListParams({
    this.next,
    this.previous,
  });
}
