part of 'food_detail_bloc.dart';

sealed class FoodDetailState extends Equatable {
  const FoodDetailState();

  @override
  List<Object> get props => [];
}

final class FoodDetailInitial extends FoodDetailState {}

final class FoodDetailLoading extends FoodDetailState {}

final class FoodDetailSuccess extends FoodDetailState {
  final FoodEntity foodEntity;
  final String message;

  const FoodDetailSuccess({
    required this.foodEntity,
    this.message = '',
  });

  @override
  List<Object> get props => [
        foodEntity,
        message,
      ];
}

final class FoodDetailFailure extends FoodDetailState {
  final String message;

  const FoodDetailFailure(this.message);

  @override
  List<Object> get props => [
        message,
      ];
}
