import 'package:nutri_kit/features/home/data/models/index.dart';
import 'package:nutri_kit/features/home/domain/entities/index.dart';

class TriviaResponseModel extends TriviaResponse {
  const TriviaResponseModel({
    required super.count,
    required super.next,
    required super.previous,
    required super.results,
  });

  factory TriviaResponseModel.fromJson(Map<String, dynamic> json) =>
      TriviaResponseModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<TriviaModel>.from(
            json["results"].map((x) => TriviaModel.fromJson(x))),
      );
}
