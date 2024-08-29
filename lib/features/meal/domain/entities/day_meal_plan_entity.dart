import 'package:nutri_kit/features/meal/domain/entities/index.dart';

class DayMealPlanEntity {
  DayMealPlanEntity({
    required this.id,
    required this.breakfast,
    required this.midMorningSnack,
    required this.lunch,
    required this.afternoonSnack,
    required this.dinner,
    required this.eveningSnack,
    required this.createdAt,
    required this.updatedAt,
    required this.dayNumber,
  });

  final int? id;
  final MealEntity breakfast;
  final MealEntity midMorningSnack;
  final MealEntity lunch;
  final MealEntity afternoonSnack;
  final MealEntity dinner;
  final MealEntity eveningSnack;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int dayNumber;
}
