import 'package:nutri_kit/features/home/data/models/index.dart';
import 'package:nutri_kit/features/home/domain/entities/index.dart';

class TriviaModel extends Trivia {
  const TriviaModel({
    required super.id,
    required super.category,
    required super.answers,
    required super.createdAt,
    required super.updatedAt,
    required super.questionText,
    required super.difficulty,
    required super.questionBanner,
  });

  factory TriviaModel.fromJson(Map<String, dynamic> json) => TriviaModel(
        id: json["id"],
        category: TriviaCategoryModel.fromJson(json["category"]),
        answers: List<TriviaAnswerModel>.from(
            json["answers"].map((x) => TriviaAnswerModel.fromJson(x))),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        questionText: json["question_text"],
        difficulty: json["difficulty"],
        questionBanner: json["question_banner"],
      );
}
