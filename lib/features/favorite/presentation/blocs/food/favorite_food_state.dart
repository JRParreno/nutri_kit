part of 'favorite_food_bloc.dart';

sealed class FavoriteFoodState extends Equatable {
  const FavoriteFoodState();

  @override
  List<Object> get props => [];
}

final class FavoriteFoodInitial extends FavoriteFoodState {}

final class FavoriteFoodLoading extends FavoriteFoodState {}

final class FavoriteFoodSuccess extends FavoriteFoodState {
  final FoodResponseEntity data;
  final bool isPaginate;

  const FavoriteFoodSuccess({
    required this.data,
    this.isPaginate = false,
  });

  FavoriteFoodSuccess copyWith({
    bool? isPaginate,
    FoodResponseEntity? data,
  }) {
    return FavoriteFoodSuccess(
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

final class FavoriteFoodFailure extends FavoriteFoodState {
  final String message;

  const FavoriteFoodFailure(this.message);

  @override
  List<Object> get props => [
        message,
      ];
}
