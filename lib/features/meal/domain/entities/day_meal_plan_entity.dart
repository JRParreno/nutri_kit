// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  DayMealPlanEntity copyWith({
    int? id,
    MealEntity? breakfast,
    MealEntity? midMorningSnack,
    MealEntity? lunch,
    MealEntity? afternoonSnack,
    MealEntity? dinner,
    MealEntity? eveningSnack,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? dayNumber,
  }) {
    return DayMealPlanEntity(
      id: id ?? this.id,
      breakfast: breakfast ?? this.breakfast,
      midMorningSnack: midMorningSnack ?? this.midMorningSnack,
      lunch: lunch ?? this.lunch,
      afternoonSnack: afternoonSnack ?? this.afternoonSnack,
      dinner: dinner ?? this.dinner,
      eveningSnack: eveningSnack ?? this.eveningSnack,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      dayNumber: dayNumber ?? this.dayNumber,
    );
  }
}
