part of 'child_health_list_bloc.dart';

sealed class ChildHealthListState extends Equatable {
  const ChildHealthListState();

  @override
  List<Object> get props => [];
}

final class ChildHealthListInitial extends ChildHealthListState {}

final class ChildHealthListLoading extends ChildHealthListState {}

final class ChildHealthListSuccess extends ChildHealthListState {
  final UserMealPlanResponseEntity userMealPlanResponseEntity;
  final bool isPaginate;

  const ChildHealthListSuccess({
    required this.userMealPlanResponseEntity,
    this.isPaginate = false,
  });

  ChildHealthListSuccess copyWith({
    UserMealPlanResponseEntity? userMealPlanResponseEntity,
    bool? isPaginate,
  }) {
    return ChildHealthListSuccess(
      userMealPlanResponseEntity:
          userMealPlanResponseEntity ?? this.userMealPlanResponseEntity,
      isPaginate: isPaginate ?? this.isPaginate,
    );
  }

  @override
  List<Object> get props => [
        userMealPlanResponseEntity,
        isPaginate,
      ];
}

final class ChildHealthListFailure extends ChildHealthListState {
  final String message;

  const ChildHealthListFailure(this.message);

  @override
  List<Object> get props => [
        message,
      ];
}
