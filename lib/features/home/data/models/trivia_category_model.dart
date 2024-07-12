import 'package:nutri_kit/features/home/domain/entities/index.dart';

class TriviaCategoryModel extends TriviaCategory {
  const TriviaCategoryModel({
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    required super.categoryName,
    required super.description,
  });

  factory TriviaCategoryModel.fromJson(Map<String, dynamic> json) =>
      TriviaCategoryModel(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        categoryName: json["category_name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "category_name": categoryName,
        "description": description,
      };
}
