part of 'search_bloc.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object?> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchRecentLoaded extends SearchState {
  final List<String> keywords;

  const SearchRecentLoaded(this.keywords);

  @override
  List<Object> get props => [
        keywords,
      ];
}

final class SearchSuccess extends SearchState {
  final DeficiencyResponse? deficiencyResponse;
  final RemediesResponse? remediesResponse;
  final FoodResponse? foodResponse;

  const SearchSuccess({
    this.deficiencyResponse,
    this.remediesResponse,
    this.foodResponse,
  });

  @override
  List<Object?> get props => [
        deficiencyResponse,
        remediesResponse,
        foodResponse,
      ];
}

final class SearchFailure extends SearchState {
  final String message;

  const SearchFailure(this.message);

  @override
  List<Object> get props => [
        message,
      ];
}
