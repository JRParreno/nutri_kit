import 'package:nutri_kit/features/food/domain/entities/index.dart';
import 'package:nutri_kit/features/search/data/models/index.dart';

class FoodModel extends FoodEntity {
  const FoodModel({
    required super.id,
    required super.category,
    required super.vitamins,
    required super.createdAt,
    required super.updatedAt,
    required super.name,
    required super.description,
    super.scientificName,
    super.image,
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
        id: json["id"],
        category: FoodCategoryModel.fromJson(json["category"]),
        vitamins: List<VitaminModel>.from(
            json["vitamins"].map((x) => VitaminModel.fromJson(x))),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        name: json["name"],
        scientificName: json["scientificName"],
        description: json["description"],
        image: json["image"],
      );
}
