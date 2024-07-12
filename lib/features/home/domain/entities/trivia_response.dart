import 'package:equatable/equatable.dart';
import 'package:nutri_kit/features/home/data/models/index.dart';

class TriviaResponse extends Equatable {
  final int count;
  final String? next;
  final String? previous;
  final List<TriviaModel> results;

  const TriviaResponse({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  @override
  List<Object?> get props => [
        count,
        next,
        previous,
        results,
      ];
}
