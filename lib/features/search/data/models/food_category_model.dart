import 'package:nutri_kit/features/search/domain/entities/index.dart';

class FoodCategoryModel extends FoodCategoryEntity {
  const FoodCategoryModel({
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    required super.name,
    required super.description,
    super.image,
  });

  factory FoodCategoryModel.fromJson(Map<String, dynamic> json) =>
      FoodCategoryModel(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        name: json["name"],
        description: json["description"],
        image: json["image"] ?? "",
      );
}
