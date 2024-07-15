import 'package:equatable/equatable.dart';

import 'package:nutri_kit/core/common/entities/list_response.dart';
import 'package:nutri_kit/features/search/domain/entities/index.dart';

class RemediesResponse extends Equatable {
  final ListResponse listResponse;
  final List<Remedy> results;

  const RemediesResponse({
    required this.listResponse,
    required this.results,
  });

  @override
  List<Object?> get props => [
        listResponse,
        results,
      ];
}
