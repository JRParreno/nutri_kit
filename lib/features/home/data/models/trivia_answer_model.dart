import 'package:nutri_kit/features/home/domain/entities/index.dart';

class TriviaAnswerModel extends TriviaAnswer {
  const TriviaAnswerModel({
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    required super.answerText,
    required super.isCorrect,
    required super.question,
  });

  factory TriviaAnswerModel.fromJson(Map<String, dynamic> json) =>
      TriviaAnswerModel(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        answerText: json["answer_text"],
        isCorrect: json["is_correct"],
        question: json["question"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "answer_text": answerText,
        "is_correct": isCorrect,
        "question": question,
      };
}
