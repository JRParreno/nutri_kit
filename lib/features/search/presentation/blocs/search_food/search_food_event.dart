part of 'search_food_bloc.dart';

sealed class SearchFoodEvent extends Equatable {
  const SearchFoodEvent();

  @override
  List<Object> get props => [];
}

final class GetSearchFoodEvent extends SearchFoodEvent {
  final String keyword;

  const GetSearchFoodEvent(this.keyword);

  @override
  List<Object> get props => [keyword];
}

final class PaginateSearchFoodEvent extends SearchFoodEvent {
  final String keyword;

  const PaginateSearchFoodEvent(this.keyword);

  @override
  List<Object> get props => [keyword];
}
