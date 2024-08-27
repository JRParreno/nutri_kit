import 'package:nutri_kit/features/deficiency/domain/entities/index.dart';

class SymptomModel extends SymptomEntity {
  SymptomModel({
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    required super.name,
    required super.description,
  });

  factory SymptomModel.fromJson(Map<String, dynamic> json) => SymptomModel(
        id: json['id'] as int,
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
        name: json['name'] as String,
        description: json['description'] as String,
      );
}
