part of 'favorite_remedy_bloc.dart';

sealed class FavoriteRemedyEvent extends Equatable {
  const FavoriteRemedyEvent();

  @override
  List<Object> get props => [];
}

final class GetFavoriteRemedyEvent extends FavoriteRemedyEvent {}

final class PaginateFavoriteRemedyEvent extends FavoriteRemedyEvent {}
