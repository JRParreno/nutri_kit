part of 'search_deficiency_bloc.dart';

sealed class SearchDeficiencyEvent extends Equatable {
  const SearchDeficiencyEvent();

  @override
  List<Object> get props => [];
}

final class GetSearchDeficiencyEvent extends SearchDeficiencyEvent {
  final String keyword;

  const GetSearchDeficiencyEvent(this.keyword);

  @override
  List<Object> get props => [keyword];
}

final class PaginateSearchDeficiencyEvent extends SearchDeficiencyEvent {
  final String keyword;

  const PaginateSearchDeficiencyEvent(this.keyword);

  @override
  List<Object> get props => [keyword];
}
