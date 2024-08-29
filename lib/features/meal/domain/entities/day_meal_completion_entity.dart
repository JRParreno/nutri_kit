import 'package:nutri_kit/features/meal/domain/entities/index.dart';

class DayMealCompletionEntity {
  DayMealCompletionEntity({
    required this.id,
    required this.dayMealPlan,
    required this.createdAt,
    required this.updatedAt,
    required this.date,
    required this.completed,
  });

  final int id;
  final DayMealPlanEntity dayMealPlan;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime date;
  final bool completed;
}
