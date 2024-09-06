import 'package:nutri_kit/core/common/entities/list_response.dart';
import 'package:nutri_kit/features/search/domain/entities/index.dart';

class DeficiencySearchResponseEntity {
  final ListResponse listResponse;
  final List<DeficiencySearchEntity> results;

  const DeficiencySearchResponseEntity({
    required this.listResponse,
    required this.results,
  });

  DeficiencySearchResponseEntity copyWith({
    ListResponse? listResponse,
    List<DeficiencySearchEntity>? results,
  }) {
    return DeficiencySearchResponseEntity(
      listResponse: listResponse ?? this.listResponse,
      results: results ?? this.results,
    );
  }
}
