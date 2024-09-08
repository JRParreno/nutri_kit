part of 'search_remedy_bloc.dart';

sealed class SearchRemedyEvent extends Equatable {
  const SearchRemedyEvent();

  @override
  List<Object> get props => [];
}

final class GetSearchRemedyEvent extends SearchRemedyEvent {
  final String keyword;

  const GetSearchRemedyEvent(this.keyword);

  @override
  List<Object> get props => [keyword];
}

final class PaginateSearchRemedyEvent extends SearchRemedyEvent {
  final String keyword;

  const PaginateSearchRemedyEvent(this.keyword);

  @override
  List<Object> get props => [keyword];
}
