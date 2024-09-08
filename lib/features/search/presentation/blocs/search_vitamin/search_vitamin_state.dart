part of 'search_vitamin_bloc.dart';

sealed class SearchVitaminState extends Equatable {
  const SearchVitaminState();

  @override
  List<Object> get props => [];
}

final class SearchVitaminInitial extends SearchVitaminState {}

final class SearchVitaminLoading extends SearchVitaminState {}

final class SearchListVitaminSuccess extends SearchVitaminState {
  final VitaminResponseEntity data;
  final bool isPaginate;

  const SearchListVitaminSuccess({
    required this.data,
    this.isPaginate = false,
  });

  SearchListVitaminSuccess copyWith({
    bool? isPaginate,
    VitaminResponseEntity? data,
  }) {
    return SearchListVitaminSuccess(
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

final class SearchVitaminFailure extends SearchVitaminState {
  final String message;

  const SearchVitaminFailure(this.message);

  @override
  List<Object> get props => [
        message,
      ];
}
