import 'package:nutri_kit/features/meal/domain/entities/index.dart';

class MealModel extends MealEntity {
  MealModel({
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    required super.name,
    required super.description,
    required super.calories,
    required super.protein,
    required super.carbs,
    required super.fats,
  });

  factory MealModel.fromJson(Map<String, dynamic> json) {
    return MealModel(
      id: json["id"],
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
      name: json["name"],
      description: json["description"],
      calories: json["calories"],
      protein: json["protein"],
      carbs: json["carbs"],
      fats: json["fats"],
    );
  }
}
