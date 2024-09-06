// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:nutri_kit/features/food/domain/entities/index.dart';

class FoodEntity extends Equatable {
  final int id;
  final FoodCategoryEntity category;
  final List<VitaminEntity> vitamins;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String name;
  final String description;
  final String? image;
  final String? scientificName;
  final bool isFavorite;

  const FoodEntity({
    required this.id,
    required this.category,
    required this.vitamins,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.description,
    this.scientificName,
    this.image,
    this.isFavorite = false,
  });

  @override
  List<Object?> get props => [
        id,
        category,
        vitamins,
        createdAt,
        updatedAt,
        name,
        scientificName,
        description,
        image,
        isFavorite,
      ];

  FoodEntity copyWith({
    int? id,
    FoodCategoryEntity? category,
    List<VitaminEntity>? vitamins,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? name,
    String? description,
    String? image,
    String? scientificName,
    bool? isFavorite,
  }) {
    return FoodEntity(
      id: id ?? this.id,
      category: category ?? this.category,
      vitamins: vitamins ?? this.vitamins,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
      scientificName: scientificName ?? this.scientificName,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
