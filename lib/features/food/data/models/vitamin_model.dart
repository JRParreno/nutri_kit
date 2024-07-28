import 'package:nutri_kit/features/food/domain/entities/index.dart';

class VitaminModel extends VitaminEntity {
  const VitaminModel({
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    required super.name,
    required super.description,
    super.image,
  });

  factory VitaminModel.fromJson(Map<String, dynamic> json) => VitaminModel(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        name: json["name"],
        description: json["description"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "name": name,
        "description": description,
        "image": image,
      };
}
