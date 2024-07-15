import 'package:nutri_kit/features/search/domain/entities/index.dart';

class RemedyModel extends Remedy {
  const RemedyModel({
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    required super.name,
    required super.description,
    super.image,
  });

  factory RemedyModel.fromJson(Map<String, dynamic> json) => RemedyModel(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        name: json["name"],
        description: json["description"],
        image: json["image"] ?? "",
      );
}
