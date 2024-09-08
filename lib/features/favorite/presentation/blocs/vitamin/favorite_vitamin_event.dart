part of 'favorite_vitamin_bloc.dart';

sealed class FavoriteVitaminEvent extends Equatable {
  const FavoriteVitaminEvent();

  @override
  List<Object> get props => [];
}

final class GetFavoriteVitaminEvent extends FavoriteVitaminEvent {}

final class PaginateFavoriteVitaminEvent extends FavoriteVitaminEvent {}
