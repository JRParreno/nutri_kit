part of 'child_health_list_bloc.dart';

sealed class ChildHealthListEvent extends Equatable {
  const ChildHealthListEvent();

  @override
  List<Object> get props => [];
}

final class OnGetChildHealthListEvent extends ChildHealthListEvent {}
final class OnPaginateChildHealthListEvent extends ChildHealthListEvent {}
