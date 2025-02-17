import 'package:equatable/equatable.dart';
import 'package:nutri_kit/core/common/entities/list_response.dart';
import 'package:nutri_kit/features/home/data/models/index.dart';

class TriviaResponse extends Equatable {
  final ListResponse listResponse;
  final List<TriviaModel> results;

  const TriviaResponse({
    required this.listResponse,
    required this.results,
  });

  @override
  List<Object?> get props => [
        listResponse,
        results,
      ];
}
