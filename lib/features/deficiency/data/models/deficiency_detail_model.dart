import 'package:nutri_kit/features/deficiency/data/models/index.dart';
import 'package:nutri_kit/features/deficiency/domain/entities/index.dart';
import 'package:nutri_kit/features/remedy/data/models/index.dart';
import 'package:nutri_kit/features/search/data/models/index.dart';

class DeficiencyDetailModel extends DeficiencyDetailEntity {
  DeficiencyDetailModel({
    required super.id,
    required super.symptoms,
    required super.remedies,
    required super.createdAt,
    required super.updatedAt,
    required super.name,
    required super.description,
    super.isFavorite,
  });

  factory DeficiencyDetailModel.fromJson(Map<String, dynamic> json) =>
      DeficiencyDetailModel(
        id: json['id'] as int,
        symptoms: List<SymptomModel>.from(
          json['symptoms'].map<SymptomModel>((x) => SymptomModel.fromJson(x)),
        ),
        remedies: List<RemedyModel>.from(
          json['remedies'].map<RemedyModel>((x) => RemedyModel.fromJson(x)),
        ),
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
        name: json['name'] as String,
        description: json['description'] as String,
        isFavorite: json["is_favorite"],
      );
}
