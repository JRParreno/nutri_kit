import 'package:nutri_kit/features/meal/data/models/index.dart';
import 'package:nutri_kit/features/meal/domain/entities/index.dart';

class DayMealPlanModel extends DayMealPlanEntity {
  DayMealPlanModel({
    required super.id,
    required super.breakfast,
    required super.midMorningSnack,
    required super.lunch,
    required super.afternoonSnack,
    required super.dinner,
    required super.eveningSnack,
    required super.createdAt,
    required super.updatedAt,
    required super.dayNumber,
  });

  factory DayMealPlanModel.fromJson(Map<String, dynamic> json) {
    return DayMealPlanModel(
      id: json["id"],
      breakfast: MealModel.fromJson(json["breakfast"]),
      midMorningSnack: MealModel.fromJson(json["mid_morning_snack"]),
      lunch: MealModel.fromJson(json["lunch"]),
      afternoonSnack: MealModel.fromJson(json["afternoon_snack"]),
      dinner: MealModel.fromJson(json["dinner"]),
      eveningSnack: MealModel.fromJson(json["evening_snack"]),
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
      dayNumber: json["day_number"],
    );
  }
}
