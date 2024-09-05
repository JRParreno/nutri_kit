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
    required super.birthdate,
    required super.height,
    required super.weight,
    required super.user,
    required super.mealPlan,
  });

  factory UserMealPlanModel.fromJson(Map<String, dynamic> json) {
    return UserMealPlanModel(
      id: json["id"],
      healthStatus: json["health_status_info"],
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
      name: json["name"],
      startDate: DateTime.parse(json["start_date"]),
      endDate: DateTime.tryParse(json["end_date"] ?? ""),
      active: json["active"],
      birthdate: DateTime.parse(json["birthdate"]),
      height: json["height"],
      weight: json["weight"],
      user: json["user"],
      mealPlan: json["meal_plan"],
    );
  }
}
