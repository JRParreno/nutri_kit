part of 'deficiency_detail_bloc.dart';

sealed class DeficiencyDetailState extends Equatable {
  const DeficiencyDetailState();

  @override
  List<Object> get props => [];
}

final class DeficiencyDetailInitial extends DeficiencyDetailState {}

final class DeficiencyDetailLoading extends DeficiencyDetailState {}

final class DeficiencyDetailSuccess extends DeficiencyDetailState {
  final DeficiencyDetailEntity deficiencyDetailEntity;

  const DeficiencyDetailSuccess(this.deficiencyDetailEntity);

  @override
  List<Object> get props => [deficiencyDetailEntity];
}

final class DeficiencyDetailFailure extends DeficiencyDetailState {
  final String message;

  const DeficiencyDetailFailure(this.message);

  @override
  List<Object> get props => [message];
}
