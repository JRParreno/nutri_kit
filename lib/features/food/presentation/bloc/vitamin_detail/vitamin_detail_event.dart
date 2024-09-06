part of 'vitamin_detail_bloc.dart';

sealed class VitaminDetailEvent extends Equatable {
  const VitaminDetailEvent();

  @override
  List<Object> get props => [];
}

final class GetVitaminDetailEvent extends VitaminDetailEvent {
  final String id;

  const GetVitaminDetailEvent(this.id);

  @override
  List<Object> get props => [id];
}

final class AddFavoriteVitaminEvent extends VitaminDetailEvent {}

final class DeleteFavoriteVitaminEvent extends VitaminDetailEvent {}
