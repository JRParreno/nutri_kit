part of 'favorite_deficiency_bloc.dart';

sealed class FavoriteDeficiencyState extends Equatable {
  const FavoriteDeficiencyState();

  @override
  List<Object> get props => [];
}

final class FavoriteDeficiencyInitial extends FavoriteDeficiencyState {}

final class FavoriteDeficiencyLoading extends FavoriteDeficiencyState {}

final class FavoriteDeficiencySuccess extends FavoriteDeficiencyState {
  final DeficiencySearchResponseEntity data;
  final bool isPaginate;

  const FavoriteDeficiencySuccess({
    required this.data,
    this.isPaginate = false,
  });

  FavoriteDeficiencySuccess copyWith({
    bool? isPaginate,
    DeficiencySearchResponseEntity? data,
  }) {
    return FavoriteDeficiencySuccess(
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

final class FavoriteDeficiencyFailure extends FavoriteDeficiencyState {
  final String message;

  const FavoriteDeficiencyFailure(this.message);

  @override
  List<Object> get props => [
        message,
      ];
}
