// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:nutri_kit/core/common/entities/list_response.dart';
import 'package:nutri_kit/features/deficiency/domain/entities/index.dart';

class DeficiencyResponseEntity {
  final ListResponse listResponse;
  final List<DeficiencyEntity> results;

  const DeficiencyResponseEntity({
    required this.listResponse,
    required this.results,
  });

  DeficiencyResponseEntity copyWith({
    ListResponse? listResponse,
    List<DeficiencyEntity>? results,
  }) {
    return DeficiencyResponseEntity(
      listResponse: listResponse ?? this.listResponse,
      results: results ?? this.results,
    );
  }
}
