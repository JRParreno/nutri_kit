// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:nutri_kit/core/common/entities/list_response.dart';
import 'package:nutri_kit/features/remedy/domain/entities/index.dart';

class RemedyResponseEntity {
  final ListResponse listResponse;
  final List<RemedyEntity> results;

  const RemedyResponseEntity({
    required this.listResponse,
    required this.results,
  });

  RemedyResponseEntity copyWith({
    ListResponse? listResponse,
    List<RemedyEntity>? results,
  }) {
    return RemedyResponseEntity(
      listResponse: listResponse ?? this.listResponse,
      results: results ?? this.results,
    );
  }
}
