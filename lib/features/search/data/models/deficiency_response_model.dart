import 'package:nutri_kit/core/common/models/list_response_model.dart';
import 'package:nutri_kit/features/search/data/models/index.dart';
import 'package:nutri_kit/features/search/domain/entities/index.dart';

class DeficiencyResponseModel extends DeficiencyResponse {
  const DeficiencyResponseModel({
    required super.listResponse,
    required super.results,
  });

  factory DeficiencyResponseModel.fromJson(Map<String, dynamic> json) =>
      DeficiencyResponseModel(
        listResponse: ListResponseModel.fromJson(json),
        results: List<DeficiencyModel>.from(
          (json['results']).map<DeficiencyModel>(
            (x) => DeficiencyModel.fromJson(x),
          ),
        ),
      );
}
