// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:nutri_kit/core/common/entities/list_response.dart';
import 'package:nutri_kit/features/food/domain/entities/index.dart';

class FoodResponseEntity extends Equatable {
  final ListResponse listResponse;
  final List<FoodEntity> results;

  const FoodResponseEntity({
    required this.listResponse,
    required this.results,
  });

  @override
  List<Object?> get props => [
        listResponse,
        results,
      ];

  FoodResponseEntity copyWith({
    ListResponse? listResponse,
    List<FoodEntity>? results,
  }) {
    return FoodResponseEntity(
      listResponse: listResponse ?? this.listResponse,
      results: results ?? this.results,
    );
  }
}
