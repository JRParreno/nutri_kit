import 'package:equatable/equatable.dart';
import 'package:nutri_kit/features/home/domain/entities/index.dart';

class Trivia extends Equatable {
  final int id;
  final TriviaCategory category;
  final List<TriviaAnswer> answers;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String questionText;
  final String difficulty;
  final dynamic questionBanner;

  const Trivia({
    required this.id,
    required this.category,
    required this.answers,
    required this.createdAt,
    required this.updatedAt,
    required this.questionText,
    required this.difficulty,
    required this.questionBanner,
  });

  @override
  List<Object?> get props => [
        id,
        category,
        answers,
        createdAt,
        updatedAt,
        questionText,
        difficulty,
        questionBanner,
      ];
}
