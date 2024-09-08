part of 'meal_plan_detail_bloc.dart';

sealed class MealPlanDetailEvent extends Equatable {
  const MealPlanDetailEvent();

  @override
  List<Object> get props => [];
}

final class GetMealPlanDetailEvent extends MealPlanDetailEvent {
  final String userMealPlanId;
  final String mealPlanId;

  const GetMealPlanDetailEvent({
    required this.mealPlanId,
    required this.userMealPlanId,
  });

  @override
  List<Object> get props => [
        mealPlanId,
        userMealPlanId,
      ];
}

final class UpdateMealPlanCompleted extends MealPlanDetailEvent {
  final int id;
  final bool isCompleted;

  const UpdateMealPlanCompleted({
    required this.id,
    required this.isCompleted,
  });

  @override
  List<Object> get props => [
        id,
        isCompleted,
      ];
}

final class DeleteUserMealPlanEvent extends MealPlanDetailEvent {
  final int id;

  const DeleteUserMealPlanEvent(this.id);

  @override
  List<Object> get props => [
        id,
      ];
}
