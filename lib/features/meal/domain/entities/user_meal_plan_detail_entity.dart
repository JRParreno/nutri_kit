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

  // factory UserMealPlanDetailEntity.fromJson(Map<String, dynamic> json) {
  //   return UserMealPlanDetailEntity(
  //     name: json["name"],
  //     healthStatus: HealthStatus.fromJson(json["health_status"]),
  //     dayMealCompletion: List<DayMealCompletion>.from(
  //         json["day_meal_completion"]!
  //             .map((x) => DayMealCompletion.fromJson(x))),
  //     userMealPlan: UserMealPlan.fromJson(json["user_meal_plan"]),
  //   );
  // }
}
