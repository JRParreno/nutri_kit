part of 'remedy_detail_bloc.dart';

sealed class RemedyDetailEvent extends Equatable {
  const RemedyDetailEvent();

  @override
  List<Object> get props => [];
}

final class GetRemedyDetailEvent extends RemedyDetailEvent {
  final String id;

  const GetRemedyDetailEvent(this.id);

  @override
  List<Object> get props => [id];
}

final class AddRemedyDetailEvent extends RemedyDetailEvent {
  final String id;

  const AddRemedyDetailEvent(this.id);

  @override
  List<Object> get props => [id];
}
