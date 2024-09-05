import 'package:nutri_kit/features/meal/domain/entities/index.dart';

class UserMealPlanDetailEntity {
  UserMealPlanDetailEntity({
    required this.name,
    required this.dayMealCompletion,
    required this.userMealPlan,
  });

  final String name;
  final List<DayMealCompletionEntity> dayMealCompletion;
  final UserMealPlanEntity userMealPlan;
}
