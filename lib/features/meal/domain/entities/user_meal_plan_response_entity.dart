// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:nutri_kit/features/meal/domain/entities/index.dart';

class UserMealPlanResponseEntity {
  UserMealPlanResponseEntity({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  final int? count;
  final dynamic next;
  final dynamic previous;
  final List<UserMealPlanEntity> results;

  UserMealPlanResponseEntity copyWith({
    int? count,
    dynamic next,
    dynamic previous,
    List<UserMealPlanEntity>? results,
  }) {
    return UserMealPlanResponseEntity(
      count: count ?? this.count,
      next: next ?? this.next,
      previous: previous ?? this.previous,
      results: results ?? this.results,
    );
  }
}
