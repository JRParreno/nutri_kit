import 'package:equatable/equatable.dart';
import 'package:nutri_kit/features/food/domain/entities/index.dart';

class FoodEntity extends Equatable {
  final int id;
  final FoodCategoryEntity category;
  final List<VitaminEntity> vitamins;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String name;
  final String scientificName;
  final String description;
  final String? image;

  const FoodEntity({
    required this.id,
    required this.category,
    required this.vitamins,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.scientificName,
    required this.description,
    this.image,
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
      ];
}
