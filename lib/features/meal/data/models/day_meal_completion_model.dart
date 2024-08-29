import 'package:nutri_kit/features/meal/data/models/index.dart';
import 'package:nutri_kit/features/meal/domain/entities/index.dart';

class DayMealCompletionModel extends DayMealCompletionEntity {
  DayMealCompletionModel({
    required super.id,
    required super.dayMealPlan,
    required super.createdAt,
    required super.updatedAt,
    required super.date,
    required super.completed,
  });

  factory DayMealCompletionModel.fromJson(Map<String, dynamic> json) {
    return DayMealCompletionModel(
      id: json["id"],
      dayMealPlan: DayMealPlanModel.fromJson(json["day_meal_plan"]),
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
      date: DateTime.parse(json["date"]),
      completed: json["completed"],
    );
  }
}
