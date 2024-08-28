import 'package:nutri_kit/features/meal/data/models/index.dart';
import 'package:nutri_kit/features/meal/domain/entities/index.dart';

class UserMealPlanModel extends UserMealPlanEntity {
  UserMealPlanModel({
    required super.id,
    required super.healthStatus,
    required super.createdAt,
    required super.updatedAt,
    required super.name,
    required super.startDate,
    required super.endDate,
    required super.active,
    required super.age,
    required super.height,
    required super.weight,
    required super.user,
    required super.mealPlan,
  });

  factory UserMealPlanModel.fromJson(Map<String, dynamic> json) {
    return UserMealPlanModel(
      id: json["id"],
      healthStatus: json["health_status"] == null
          ? null
          : HealthStatusModel.fromJson(json["health_status"]),
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      name: json["name"],
      startDate: DateTime.tryParse(json["start_date"] ?? ""),
      endDate: json["end_date"],
      active: json["active"],
      age: json["age"],
      height: json["height"],
      weight: json["weight"],
      user: json["user"],
      mealPlan: json["meal_plan"],
    );
  }
}
