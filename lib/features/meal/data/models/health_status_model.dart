import 'package:nutri_kit/features/meal/domain/entities/index.dart';

class HealthStatusModel extends HealthStatusEntity {
  HealthStatusModel({
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    required super.status,
    required super.description,
  });

  factory HealthStatusModel.fromJson(Map<String, dynamic> json) {
    return HealthStatusModel(
      id: json["id"],
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
      status: json["status"],
      description: json["description"],
    );
  }
}
