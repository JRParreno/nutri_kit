// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:nutri_kit/core/common/entities/list_response.dart';
import 'package:nutri_kit/features/food/domain/entities/index.dart';

class VitaminResponseEntity extends Equatable {
  final ListResponse listResponse;
  final List<VitaminEntity> results;

  const VitaminResponseEntity({
    required this.listResponse,
    required this.results,
  });

  @override
  List<Object?> get props => [
        listResponse,
        results,
      ];

  VitaminResponseEntity copyWith({
    ListResponse? listResponse,
    List<VitaminEntity>? results,
  }) {
    return VitaminResponseEntity(
      listResponse: listResponse ?? this.listResponse,
      results: results ?? this.results,
    );
  }
}
