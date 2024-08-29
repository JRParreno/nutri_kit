import 'package:nutri_kit/features/meal/domain/entities/index.dart';

class UserMealPlanDetailEntity {
  UserMealPlanDetailEntity({
    required this.name,
    required this.healthStatus,
    required this.dayMealCompletion,
    required this.userMealPlan,
  });

  final String name;
  final HealthStatusEntity healthStatus;
  final List<DayMealCompletionEntity> dayMealCompletion;
  final UserMealPlanEntity? userMealPlan;
}
