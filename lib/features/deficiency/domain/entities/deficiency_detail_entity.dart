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

  DeficiencyDetailEntity({
    required this.id,
    required this.symptoms,
    required this.remedies,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.description,
  });
}
