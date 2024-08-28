import 'package:nutri_kit/features/meal/data/models/index.dart';
import 'package:nutri_kit/features/meal/domain/entities/index.dart';

class UserMealPlanResponseModel extends UserMealPlanResponseEntity {
  UserMealPlanResponseModel({
    required super.count,
    required super.next,
    required super.previous,
    required super.results,
  });

  factory UserMealPlanResponseModel.fromJson(Map<String, dynamic> json) {
    return UserMealPlanResponseModel(
      count: json["count"],
      next: json["next"],
      previous: json["previous"],
      results: json["results"] == null
          ? []
          : List<UserMealPlanModel>.from(
              json["results"]!.map(
                (x) => UserMealPlanModel.fromJson(x),
              ),
            ),
    );
  }
}
