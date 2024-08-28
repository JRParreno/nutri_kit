import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_kit/features/meal/domain/entities/index.dart';
import 'package:nutri_kit/features/meal/domain/usecase/get_child_list.dart';

part 'child_health_list_event.dart';
part 'child_health_list_state.dart';

class ChildHealthListBloc
    extends Bloc<ChildHealthListEvent, ChildHealthListState> {
  final GetChildList _getChildList;

  ChildHealthListBloc(GetChildList getChildList)
      : _getChildList = getChildList,
        super(ChildHealthListInitial()) {
    on<OnGetChildHealthListEvent>(onGetChildHealthListEvent);
    on<OnPaginateChildHealthListEvent>(onPaginateChildHealthListEvent);
  }

  void onGetChildHealthListEvent(OnGetChildHealthListEvent event,
      Emitter<ChildHealthListState> emit) async {
    emit(ChildHealthListLoading());

    final response = await _getChildList.call(GetChildListParams());

    response.fold(
      (l) => emit(ChildHealthListFailure(l.message)),
      (r) => emit(ChildHealthListSuccess(
        userMealPlanResponseEntity: r,
      )),
    );
  }

  void onPaginateChildHealthListEvent(OnPaginateChildHealthListEvent event,
      Emitter<ChildHealthListState> emit) async {
    final state = this.state;

    if (state is ChildHealthListSuccess) {
      emit(state.copyWith(isPaginate: true));

      final response = await _getChildList.call(GetChildListParams(
        previous: state.userMealPlanResponseEntity.previous,
        next: state.userMealPlanResponseEntity.next,
      ));

      response.fold(
        (l) => emit(ChildHealthListFailure(l.message)),
        (r) => emit(
          state.copyWith(
            userMealPlanResponseEntity: r.copyWith(
              results: [
                ...state.userMealPlanResponseEntity.results,
                ...r.results
              ],
            ),
            isPaginate: false,
          ),
        ),
      );
    }
  }
}
