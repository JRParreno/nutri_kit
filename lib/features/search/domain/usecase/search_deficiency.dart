import 'package:fpdart/fpdart.dart';
import 'package:nutri_kit/core/error/failure.dart';
import 'package:nutri_kit/core/usecase/usecase.dart';
import 'package:nutri_kit/features/search/domain/repository/search_repository.dart';
import 'package:nutri_kit/features/deficiency/domain/entities/index.dart';

class SearchDeficiency
    implements UseCase<DeficiencyResponseEntity, SearchParams> {
  final SearchRepository searchRepository;

  const SearchDeficiency(this.searchRepository);

  @override
  Future<Either<Failure, DeficiencyResponseEntity>> call(
      SearchParams params) async {
    return await searchRepository.searchDeficiencies(
      keyword: params.keyword,
      next: params.next,
      previous: params.previous,
    );
  }
}
