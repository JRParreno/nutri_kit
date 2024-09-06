part of 'food_detail_bloc.dart';

sealed class FoodDetailEvent extends Equatable {
  const FoodDetailEvent();

  @override
  List<Object> get props => [];
}

final class GetFoodDetailEvent extends FoodDetailEvent {
  final String id;

  const GetFoodDetailEvent(this.id);

  @override
  List<Object> get props => [id];
}

final class AddFavoriteFoodEvent extends FoodDetailEvent {}

final class DeleteFavoriteFoodEvent extends FoodDetailEvent {}
