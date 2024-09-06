part of 'favorite_deficiency_bloc.dart';

sealed class FavoriteDeficiencyEvent extends Equatable {
  const FavoriteDeficiencyEvent();

  @override
  List<Object> get props => [];
}

final class GetFavoriteDeficiencyEvent extends FavoriteDeficiencyEvent {}

final class PaginateFavoriteDeficiencyEvent extends FavoriteDeficiencyEvent {}
