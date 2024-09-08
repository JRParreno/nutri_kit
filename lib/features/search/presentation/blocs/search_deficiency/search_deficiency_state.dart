part of 'search_deficiency_bloc.dart';

sealed class SearchDeficiencyState extends Equatable {
  const SearchDeficiencyState();

  @override
  List<Object> get props => [];
}

final class SearchDeficiencyInitial extends SearchDeficiencyState {}

final class SearchDeficiencyLoading extends SearchDeficiencyState {}

final class SearchListDeficiencySuccess extends SearchDeficiencyState {
  final DeficiencySearchResponseEntity data;
  final bool isPaginate;

  const SearchListDeficiencySuccess({
    required this.data,
    this.isPaginate = false,
  });

  SearchListDeficiencySuccess copyWith({
    bool? isPaginate,
    DeficiencySearchResponseEntity? data,
  }) {
    return SearchListDeficiencySuccess(
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

final class SearchDeficiencyFailure extends SearchDeficiencyState {
  final String message;

  const SearchDeficiencyFailure(this.message);

  @override
  List<Object> get props => [
        message,
      ];
}
