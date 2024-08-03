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

  const FoodDetailSuccess(this.foodEntity);

  @override
  List<Object> get props => [
        foodEntity,
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
