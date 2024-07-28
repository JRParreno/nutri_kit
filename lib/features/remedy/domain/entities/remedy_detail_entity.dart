import 'package:nutri_kit/features/food/domain/entities/index.dart';

class RemedyDetailEntity {
  final int id;
  final String name;
  final String description;
  final String? image;
  final String? scientificName;
  final List<FoodEntity> foods;

  const RemedyDetailEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.foods,
    this.image,
    this.scientificName,
  });
}
