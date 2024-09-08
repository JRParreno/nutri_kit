part of 'favorite_vitamin_bloc.dart';

sealed class FavoriteVitaminState extends Equatable {
  const FavoriteVitaminState();

  @override
  List<Object> get props => [];
}

final class FavoriteVitaminInitial extends FavoriteVitaminState {}

final class FavoriteVitaminLoading extends FavoriteVitaminState {}

final class FavoriteVitaminSuccess extends FavoriteVitaminState {
  final VitaminResponseEntity data;
  final bool isPaginate;

  const FavoriteVitaminSuccess({
    required this.data,
    this.isPaginate = false,
  });

  FavoriteVitaminSuccess copyWith({
    bool? isPaginate,
    VitaminResponseEntity? data,
  }) {
    return FavoriteVitaminSuccess(
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

final class FavoriteVitaminFailure extends FavoriteVitaminState {
  final String message;

  const FavoriteVitaminFailure(this.message);

  @override
  List<Object> get props => [
        message,
      ];
}
