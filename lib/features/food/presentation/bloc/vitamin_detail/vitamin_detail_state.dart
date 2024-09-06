part of 'vitamin_detail_bloc.dart';

sealed class VitaminDetailState extends Equatable {
  const VitaminDetailState();

  @override
  List<Object> get props => [];
}

final class VitaminDetailInitial extends VitaminDetailState {}

final class VitaminDetailLoading extends VitaminDetailState {}

final class VitaminDetailSuccess extends VitaminDetailState {
  final VitaminEntity vitaminEntity;
  final String message;

  const VitaminDetailSuccess({
    required this.vitaminEntity,
    this.message = '',
  });

  @override
  List<Object> get props => [
        vitaminEntity,
        message,
      ];
}

final class VitaminDetailFailure extends VitaminDetailState {
  final String message;

  const VitaminDetailFailure(this.message);

  @override
  List<Object> get props => [
        message,
      ];
}
