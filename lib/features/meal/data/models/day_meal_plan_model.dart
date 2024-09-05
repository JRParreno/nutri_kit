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
      breakfast: json["breakfast"] == null
          ? null
          : MealModel.fromJson(json["breakfast"]),
      midMorningSnack: json["mid_morning_snack"] == null
          ? null
          : MealModel.fromJson(json["mid_morning_snack"]),
      lunch: json["lunch"] == null ? null : MealModel.fromJson(json["lunch"]),
      afternoonSnack: json["afternoon_snack"] == null
          ? null
          : MealModel.fromJson(json["afternoon_snack"]),
      dinner:
          json["dinner"] == null ? null : MealModel.fromJson(json["dinner"]),
      eveningSnack: json["evening_snack"] == null
          ? null
          : MealModel.fromJson(json["evening_snack"]),
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
      dayNumber: json["day_number"],
    );
  }
}
