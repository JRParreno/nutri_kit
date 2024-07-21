import 'package:nutri_kit/core/common/models/list_response_model.dart';
import 'package:nutri_kit/features/search/data/models/index.dart';
import 'package:nutri_kit/features/search/domain/entities/index.dart';

class VitaminResponseModel extends VitaminResponseEntity {
  const VitaminResponseModel({
    required super.listResponse,
    required super.results,
  });

  factory VitaminResponseModel.fromJson(Map<String, dynamic> json) =>
      VitaminResponseModel(
        listResponse: ListResponseModel.fromJson(json),
        results: List<VitaminModel>.from(
          (json['results']).map<VitaminModel>(
            (x) => VitaminModel.fromJson(x),
          ),
        ),
      );
}
