import 'package:nutri_kit/features/meal/domain/entities/index.dart';

class DayMealPlanEntity {
  DayMealPlanEntity({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.dayNumber,
    this.breakfast,
    this.midMorningSnack,
    this.lunch,
    this.afternoonSnack,
    this.dinner,
    this.eveningSnack,
  });

  final int? id;
  final MealEntity? breakfast;
  final MealEntity? midMorningSnack;
  final MealEntity? lunch;
  final MealEntity? afternoonSnack;
  final MealEntity? dinner;
  final MealEntity? eveningSnack;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int dayNumber;
}
