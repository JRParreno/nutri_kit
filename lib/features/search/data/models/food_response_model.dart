import 'package:nutri_kit/core/common/models/list_response_model.dart';
import 'package:nutri_kit/features/search/data/models/index.dart';
import 'package:nutri_kit/features/search/domain/entities/index.dart';

class FoodResponseModel extends FoodResponse {
  const FoodResponseModel({
    required super.listResponse,
    required super.results,
  });

  factory FoodResponseModel.fromJson(Map<String, dynamic> json) =>
      FoodResponseModel(
        listResponse: ListResponseModel.fromJson(json),
        results: List<FoodModel>.from(
          (json['results']).map<FoodModel>(
            (x) => FoodModel.fromJson(x),
          ),
        ),
      );
}
