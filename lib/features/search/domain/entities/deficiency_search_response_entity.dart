import 'package:nutri_kit/core/common/entities/list_response.dart';
import 'package:nutri_kit/features/search/domain/entities/index.dart';

class DeficiencySearchResponseEntity {
  final ListResponse listResponse;
  final List<DeficiencySearchEntity> results;

  const DeficiencySearchResponseEntity({
    required this.listResponse,
    required this.results,
  });
}
