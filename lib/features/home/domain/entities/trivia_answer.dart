import 'package:equatable/equatable.dart';

class TriviaAnswer extends Equatable {
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String answerText;
  final bool isCorrect;
  final int question;

  const TriviaAnswer({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.answerText,
    required this.isCorrect,
    required this.question,
  });

  @override
  List<Object?> get props => [
        id,
        createdAt,
        createdAt,
        updatedAt,
        answerText,
        isCorrect,
        question,
      ];
}
