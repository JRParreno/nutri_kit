import 'package:nutri_kit/features/meal/domain/entities/index.dart';

class UserMealPlanCreationModel extends UserMealPlanCreationEntity {
  UserMealPlanCreationModel({
    required super.usermealplanId,
    required super.mealplanId,
  });

  factory UserMealPlanCreationModel.fromJson(Map<String, dynamic> json) {
    return UserMealPlanCreationModel(
      mealplanId: json['mealplan_id'],
      usermealplanId: json['usermealplan_id'],
    );
  }
}
