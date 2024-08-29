// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  DayMealCompletionEntity copyWith({
    int? id,
    DayMealPlanEntity? dayMealPlan,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? date,
    bool? completed,
  }) {
    return DayMealCompletionEntity(
      id: id ?? this.id,
      dayMealPlan: dayMealPlan ?? this.dayMealPlan,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      date: date ?? this.date,
      completed: completed ?? this.completed,
    );
  }
}
