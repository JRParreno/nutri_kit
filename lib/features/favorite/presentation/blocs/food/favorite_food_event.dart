part of 'favorite_food_bloc.dart';

sealed class FavoriteFoodEvent extends Equatable {
  const FavoriteFoodEvent();

  @override
  List<Object> get props => [];
}

final class GetFavoriteFoodEvent extends FavoriteFoodEvent {}

final class PaginateFavoriteFoodEvent extends FavoriteFoodEvent {}
