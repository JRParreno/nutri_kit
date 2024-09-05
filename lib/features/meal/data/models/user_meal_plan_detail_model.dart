import 'package:nutri_kit/features/meal/data/models/index.dart';
import 'package:nutri_kit/features/meal/domain/entities/index.dart';

class UserMealPlanDetailModel extends UserMealPlanDetailEntity {
  UserMealPlanDetailModel({
    required super.name,
    required super.dayMealCompletion,
    required super.userMealPlan,
    required super.totalCalories,
    required super.totalProtein,
    required super.totalCarbs,
    required super.totalFats,
    required super.currentCalories,
    required super.currentProtein,
    required super.currentCarbs,
    required super.currentFats,
  });

  factory UserMealPlanDetailModel.fromJson(Map<String, dynamic> json) {
    return UserMealPlanDetailModel(
      name: json["name"],
      dayMealCompletion: List<DayMealCompletionModel>.from(
          json["day_meal_completion"]!
              .map((x) => DayMealCompletionModel.fromJson(x))),
      userMealPlan: UserMealPlanModel.fromJson(json["user_meal_plan"]),
      currentCalories: json["current_calories"],
      currentCarbs: json["current_carbs"],
      currentFats: json["current_fats"],
      currentProtein: json["current_protein"],
      totalCalories: json["total_calories"],
      totalCarbs: json["total_carbs"],
      totalFats: json["total_fats"],
      totalProtein: json["total_protein"],
    );
  }
}
