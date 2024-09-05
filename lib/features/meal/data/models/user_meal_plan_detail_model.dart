import 'package:nutri_kit/features/meal/data/models/index.dart';
import 'package:nutri_kit/features/meal/domain/entities/index.dart';

class UserMealPlanDetailModel extends UserMealPlanDetailEntity {
  UserMealPlanDetailModel({
    required super.name,
    required super.dayMealCompletion,
    required super.userMealPlan,
  });

  factory UserMealPlanDetailModel.fromJson(Map<String, dynamic> json) {
    return UserMealPlanDetailModel(
      name: json["name"],
      dayMealCompletion: List<DayMealCompletionModel>.from(
          json["day_meal_completion"]!
              .map((x) => DayMealCompletionModel.fromJson(x))),
      userMealPlan: UserMealPlanModel.fromJson(json["user_meal_plan"]),
    );
  }
}
