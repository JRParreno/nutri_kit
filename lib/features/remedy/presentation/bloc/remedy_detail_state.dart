part of 'remedy_detail_bloc.dart';

sealed class RemedyDetailState extends Equatable {
  const RemedyDetailState();

  @override
  List<Object> get props => [];
}

final class RemedyDetailInitial extends RemedyDetailState {}

final class RemedyDetailLoading extends RemedyDetailState {}

final class RemedyDetailSuccess extends RemedyDetailState {
  final RemedyDetailEntity remedyDetailEntity;

  const RemedyDetailSuccess(this.remedyDetailEntity);

  @override
  List<Object> get props => [remedyDetailEntity];
}

final class RemedyDetailFailure extends RemedyDetailState {
  final String message;

  const RemedyDetailFailure(this.message);

  @override
  List<Object> get props => [message];
}
