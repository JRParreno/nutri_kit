part of 'search_vitamin_bloc.dart';

sealed class SearchVitaminEvent extends Equatable {
  const SearchVitaminEvent();

  @override
  List<Object> get props => [];
}

final class GetSearchVitaminEvent extends SearchVitaminEvent {
  final String keyword;

  const GetSearchVitaminEvent(this.keyword);

  @override
  List<Object> get props => [keyword];
}

final class PaginateSearchVitaminEvent extends SearchVitaminEvent {
  final String keyword;

  const PaginateSearchVitaminEvent(this.keyword);

  @override
  List<Object> get props => [keyword];
}
