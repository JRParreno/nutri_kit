part of 'favorite_remedy_bloc.dart';

sealed class FavoriteRemedyState extends Equatable {
  const FavoriteRemedyState();

  @override
  List<Object> get props => [];
}

final class FavoriteRemedyInitial extends FavoriteRemedyState {}

final class FavoriteRemedyLoading extends FavoriteRemedyState {}

final class FavoriteRemedySuccess extends FavoriteRemedyState {
  final RemediesResponseEntity data;
  final bool isPaginate;

  const FavoriteRemedySuccess({
    required this.data,
    this.isPaginate = false,
  });

  FavoriteRemedySuccess copyWith({
    bool? isPaginate,
    RemediesResponseEntity? data,
  }) {
    return FavoriteRemedySuccess(
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

final class FavoriteRemedyFailure extends FavoriteRemedyState {
  final String message;

  const FavoriteRemedyFailure(this.message);

  @override
  List<Object> get props => [
        message,
      ];
}
