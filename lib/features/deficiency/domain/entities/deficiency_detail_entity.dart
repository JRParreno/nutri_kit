// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:nutri_kit/features/deficiency/domain/entities/index.dart';
import 'package:nutri_kit/features/remedy/domain/entities/index.dart';

class DeficiencyDetailEntity {
  final int id;
  final List<SymptomEntity> symptoms;
  final List<RemedyEntity> remedies;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String name;
  final String description;
  final bool isFavorite;

  DeficiencyDetailEntity({
    required this.id,
    required this.symptoms,
    required this.remedies,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.description,
    this.isFavorite = false,
  });

  DeficiencyDetailEntity copyWith({
    int? id,
    List<SymptomEntity>? symptoms,
    List<RemedyEntity>? remedies,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? name,
    String? description,
    bool? isFavorite,
  }) {
    return DeficiencyDetailEntity(
      id: id ?? this.id,
      symptoms: symptoms ?? this.symptoms,
      remedies: remedies ?? this.remedies,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
      description: description ?? this.description,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
