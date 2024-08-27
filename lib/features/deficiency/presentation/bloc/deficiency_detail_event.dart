part of 'deficiency_detail_bloc.dart';

sealed class DeficiencyDetailEvent extends Equatable {
  const DeficiencyDetailEvent();

  @override
  List<Object> get props => [];
}

final class GetDeficiencyDetailEvent extends DeficiencyDetailEvent {
  final String id;

  const GetDeficiencyDetailEvent(this.id);

  @override
  List<Object> get props => [id];
}
