import 'package:fpdart/fpdart.dart';
import 'package:nutri_kit/core/error/failure.dart';
import 'package:nutri_kit/core/usecase/usecase.dart';
import 'package:nutri_kit/features/search/domain/entities/index.dart';
import 'package:nutri_kit/features/search/domain/repository/search_repository.dart';

class SearchVitamin implements UseCase<VitaminResponseEntity, SearchParams> {
  final SearchRepository searchRepository;

  const SearchVitamin(this.searchRepository);

  @override
  Future<Either<Failure, VitaminResponseEntity>> call(
      SearchParams params) async {
    return await searchRepository.searchVitamins(
      keyword: params.keyword,
      next: params.next,
      previous: params.previous,
    );
  }
}
