import 'package:nutri_kit/features/food/data/models/index.dart';
import 'package:nutri_kit/features/remedy/domain/entities/index.dart';

class RemedyDetailModel extends RemedyDetailEntity {
  const RemedyDetailModel({
    required super.id,
    required super.name,
    required super.description,
    required super.foods,
    super.image,
    super.scientificName,
  });

  factory RemedyDetailModel.fromJson(Map<String, dynamic> json) =>
      RemedyDetailModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        scientificName: json["scientific_name"],
        foods: List<FoodModel>.from(
          (json["foods"]).map(
            (x) => FoodModel.fromJson(x['food']),
          ),
        ),
      );
}
