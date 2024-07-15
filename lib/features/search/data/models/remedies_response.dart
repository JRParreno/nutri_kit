import 'package:nutri_kit/core/common/models/list_response_model.dart';
import 'package:nutri_kit/features/search/data/models/index.dart';
import 'package:nutri_kit/features/search/domain/entities/index.dart';

class RemediesResponseModel extends RemediesResponse {
  const RemediesResponseModel({
    required super.listResponse,
    required super.results,
  });

  factory RemediesResponseModel.fromJson(Map<String, dynamic> json) =>
      RemediesResponseModel(
        listResponse: ListResponseModel.fromJson(json),
        results: List<RemedyModel>.from(
          (json['results']).map<RemedyModel>(
            (x) => RemedyModel.fromJson(x),
          ),
        ),
      );
}
