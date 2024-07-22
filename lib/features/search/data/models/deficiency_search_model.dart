import 'package:nutri_kit/features/search/domain/entities/index.dart';

class DeficiencySearchModel extends DeficiencySearchEntity {
  const DeficiencySearchModel({
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    required super.name,
    required super.description,
  });

  factory DeficiencySearchModel.fromJson(Map<String, dynamic> json) =>
      DeficiencySearchModel(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        name: json["name"],
        description: json["description"],
      );
}
