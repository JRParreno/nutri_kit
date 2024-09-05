import 'package:nutri_kit/features/meal/domain/entities/index.dart';

class UserMealPlanDetailEntity {
  UserMealPlanDetailEntity({
    required this.name,
    required this.dayMealCompletion,
    required this.userMealPlan,
    required this.totalCalories,
    required this.totalProtein,
    required this.totalCarbs,
    required this.totalFats,
    required this.currentCalories,
    required this.currentProtein,
    required this.currentCarbs,
    required this.currentFats,
  });

  final String name;
  final List<DayMealCompletionEntity> dayMealCompletion;
  final UserMealPlanEntity userMealPlan;
  final double totalCalories;
  final double totalProtein;
  final double totalCarbs;
  final double totalFats;
  final double currentCalories;
  final double currentProtein;
  final double currentCarbs;
  final double currentFats;

  UserMealPlanDetailEntity copyWith({
    String? name,
    List<DayMealCompletionEntity>? dayMealCompletion,
    UserMealPlanEntity? userMealPlan,
    double? totalCalories,
    double? totalProtein,
    double? totalCarbs,
    double? totalFats,
    double? currentCalories,
    double? currentProtein,
    double? currentCarbs,
    double? currentFats,
  }) {
    return UserMealPlanDetailEntity(
      name: name ?? this.name,
      dayMealCompletion: dayMealCompletion ?? this.dayMealCompletion,
      userMealPlan: userMealPlan ?? this.userMealPlan,
      totalCalories: totalCalories ?? this.totalCalories,
      totalProtein: totalProtein ?? this.totalProtein,
      totalCarbs: totalCarbs ?? this.totalCarbs,
      totalFats: totalFats ?? this.totalFats,
      currentCalories: currentCalories ?? this.currentCalories,
      currentProtein: currentProtein ?? this.currentProtein,
      currentCarbs: currentCarbs ?? this.currentCarbs,
      currentFats: currentFats ?? this.currentFats,
    );
  }
}
