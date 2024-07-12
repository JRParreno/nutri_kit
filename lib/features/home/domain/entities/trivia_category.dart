import 'package:equatable/equatable.dart';

class TriviaCategory extends Equatable {
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String categoryName;
  final String description;

  const TriviaCategory({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.categoryName,
    required this.description,
  });

  @override
  List<Object?> get props => [
        id,
        createdAt,
        updatedAt,
        categoryName,
        description,
      ];
}
