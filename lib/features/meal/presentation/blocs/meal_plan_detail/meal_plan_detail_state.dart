// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'meal_plan_detail_bloc.dart';

sealed class MealPlanDetailState extends Equatable {
  const MealPlanDetailState();

  @override
  List<Object> get props => [];
}

final class MealPlanDetailInitial extends MealPlanDetailState {}

final class MealPlanDetailLoading extends MealPlanDetailState {}

final class MealPlanDetailSuccess extends MealPlanDetailState {
  final UserMealPlanDetailEntity userMealPlanDetailEntity;
  final bool isUpdatingValue;

  const MealPlanDetailSuccess({
    required this.userMealPlanDetailEntity,
    this.isUpdatingValue = false,
  });

  @override
  List<Object> get props => [
        userMealPlanDetailEntity,
        isUpdatingValue,
      ];
}

final class MealPlanDetailFailure extends MealPlanDetailState {
  final String message;

  const MealPlanDetailFailure(this.message);

  @override
  List<Object> get props => [
        message,
      ];
}
