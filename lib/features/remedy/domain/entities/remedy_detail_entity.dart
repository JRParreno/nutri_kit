// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:nutri_kit/features/food/domain/entities/index.dart';

class RemedyDetailEntity {
  final int id;
  final String name;
  final String description;
  final String? image;
  final String? scientificName;
  final List<FoodEntity> foods;
  final bool isFavorite;

  const RemedyDetailEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.foods,
    this.image,
    this.scientificName,
    this.isFavorite = false,
  });

  RemedyDetailEntity copyWith({
    int? id,
    String? name,
    String? description,
    String? image,
    String? scientificName,
    List<FoodEntity>? foods,
    bool? isFavorite,
  }) {
    return RemedyDetailEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
      scientificName: scientificName ?? this.scientificName,
      foods: foods ?? this.foods,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
