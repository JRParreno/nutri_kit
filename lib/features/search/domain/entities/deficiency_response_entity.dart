import 'package:nutri_kit/core/common/entities/list_response.dart';
import 'package:nutri_kit/features/search/domain/entities/index.dart';

class DeficiencyResponseEntity {
  final ListResponse listResponse;
  final List<DeficiencyEntity> results;

  const DeficiencyResponseEntity({
    required this.listResponse,
    required this.results,
  });
}
