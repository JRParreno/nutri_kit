part of 'search_food_bloc.dart';

sealed class SearchFoodState extends Equatable {
  const SearchFoodState();

  @override
  List<Object> get props => [];
}

final class SearchFoodInitial extends SearchFoodState {}

final class SearchFoodLoading extends SearchFoodState {}

final class SearchListFoodSuccess extends SearchFoodState {
  final FoodResponseEntity data;
  final bool isPaginate;

  const SearchListFoodSuccess({
    required this.data,
    this.isPaginate = false,
  });

  SearchListFoodSuccess copyWith({
    bool? isPaginate,
    FoodResponseEntity? data,
  }) {
    return SearchListFoodSuccess(
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

final class SearchFoodFailure extends SearchFoodState {
  final String message;

  const SearchFoodFailure(this.message);

  @override
  List<Object> get props => [
        message,
      ];
}
