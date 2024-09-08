part of 'search_remedy_bloc.dart';

sealed class SearchRemedyState extends Equatable {
  const SearchRemedyState();

  @override
  List<Object> get props => [];
}

final class SearchRemedyInitial extends SearchRemedyState {}

final class SearchRemedyLoading extends SearchRemedyState {}

final class SearchListRemedySuccess extends SearchRemedyState {
  final RemediesResponseEntity data;
  final bool isPaginate;

  const SearchListRemedySuccess({
    required this.data,
    this.isPaginate = false,
  });

  SearchListRemedySuccess copyWith({
    bool? isPaginate,
    RemediesResponseEntity? data,
  }) {
    return SearchListRemedySuccess(
      isPaginate: isPaginate ?? this.isPaginate,
      data: data ?? this.data,
    );
  }

  @override
  List<Object> get props => [
        data,
        isPaginate,
      ];
}

final class SearchRemedyFailure extends SearchRemedyState {
  final String message;

  const SearchRemedyFailure(this.message);

  @override
  List<Object> get props => [
        message,
      ];
}
