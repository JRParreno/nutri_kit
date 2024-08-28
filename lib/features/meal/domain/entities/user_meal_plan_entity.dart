// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:nutri_kit/features/meal/domain/entities/index.dart';

class UserMealPlanEntity {
  UserMealPlanEntity({
    required this.id,
    required this.healthStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.active,
    required this.age,
    required this.height,
    required this.weight,
    required this.user,
    required this.mealPlan,
  });

  final int? id;
  final HealthStatusEntity? healthStatus;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? name;
  final DateTime? startDate;
  final dynamic endDate;
  final bool? active;
  final int? age;
  final String? height;
  final String? weight;
  final int? user;
  final int? mealPlan;
}
