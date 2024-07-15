import 'package:nutri_kit/core/common/models/list_response_model.dart';
import 'package:nutri_kit/features/home/data/models/index.dart';
import 'package:nutri_kit/features/home/domain/entities/index.dart';

class TriviaResponseModel extends TriviaResponse {
  const TriviaResponseModel({
    required super.listResponse,
    required super.results,
  });

  factory TriviaResponseModel.fromJson(Map<String, dynamic> json) =>
      TriviaResponseModel(
        listResponse: ListResponseModel.fromJson(json),
        results: List<TriviaModel>.from(
            json["results"].map((x) => TriviaModel.fromJson(x))),
      );
}
