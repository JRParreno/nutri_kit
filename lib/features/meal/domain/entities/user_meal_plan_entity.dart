import 'package:nutri_kit/features/meal/domain/entities/index.dart';

class UserMealPlanEntity {
  UserMealPlanEntity({
    required this.id,
    required this.healthStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.startDate,
    required this.active,
    required this.birthdate,
    required this.height,
    required this.weight,
    required this.user,
    required this.mealPlan,
    this.endDate,
  });

  final int id;
  final HealthStatusEntity healthStatus;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String name;
  final DateTime startDate;
  final DateTime? endDate;
  final bool active;
  final DateTime birthdate;
  final String height;
  final String weight;
  final int user;
  final int mealPlan;
}
