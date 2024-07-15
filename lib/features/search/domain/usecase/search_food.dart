import 'package:fpdart/fpdart.dart';
import 'package:nutri_kit/core/error/failure.dart';
import 'package:nutri_kit/core/usecase/usecase.dart';
import 'package:nutri_kit/features/search/domain/entities/index.dart';
import 'package:nutri_kit/features/search/domain/repository/search_repository.dart';

class SearchFood implements UseCase<FoodResponse, SearchFoodParams> {
  final SearchRepository searchRepository;

  const SearchFood(this.searchRepository);

  @override
  Future<Either<Failure, FoodResponse>> call(SearchFoodParams params) async {
    return await searchRepository.searchFoods(
      keyword: params.keyword,
      next: params.next,
      previous: params.previous,
    );
  }
}

class SearchFoodParams {
  final String keyword;
  final String? next;
  final String? previous;

  const SearchFoodParams({
    required this.keyword,
    this.next,
    this.previous,
  });
}
