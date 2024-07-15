import 'package:fpdart/fpdart.dart';
import 'package:nutri_kit/core/error/failure.dart';
import 'package:nutri_kit/core/usecase/usecase.dart';
import 'package:nutri_kit/features/search/domain/entities/index.dart';
import 'package:nutri_kit/features/search/domain/repository/search_repository.dart';

class SearchRemedy implements UseCase<RemediesResponse, SearchRemedyParams> {
  final SearchRepository searchRepository;

  const SearchRemedy(this.searchRepository);

  @override
  Future<Either<Failure, RemediesResponse>> call(
      SearchRemedyParams params) async {
    return await searchRepository.searchRemedies(
      keyword: params.keyword,
      next: params.next,
      previous: params.previous,
    );
  }
}

class SearchRemedyParams {
  final String keyword;
  final String? next;
  final String? previous;

  const SearchRemedyParams({
    required this.keyword,
    this.next,
    this.previous,
  });
}
