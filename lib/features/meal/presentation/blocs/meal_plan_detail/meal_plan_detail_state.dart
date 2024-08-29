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

  const MealPlanDetailSuccess(this.userMealPlanDetailEntity);

  @override
  List<Object> get props => [
        userMealPlanDetailEntity,
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
