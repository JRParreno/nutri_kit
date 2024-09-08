import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_kit/core/usecase/usecase.dart';
import 'package:nutri_kit/features/search/domain/entities/index.dart';
import 'package:nutri_kit/features/search/domain/usecase/search_deficiency.dart';

part 'search_deficiency_event.dart';
part 'search_deficiency_state.dart';

class SearchDeficiencyBloc
    extends Bloc<SearchDeficiencyEvent, SearchDeficiencyState> {
  final SearchDeficiency _getListSearchDeficiency;

  SearchDeficiencyBloc(SearchDeficiency getListSearchDeficiency)
      : _getListSearchDeficiency = getListSearchDeficiency,
        super(SearchDeficiencyInitial()) {
    on<GetSearchDeficiencyEvent>(onGetSearchDeficiencyEvent);
    on<PaginateSearchDeficiencyEvent>(onPaginateSearchDeficiencyEvent);
  }

  FutureOr<void> onGetSearchDeficiencyEvent(GetSearchDeficiencyEvent event,
      Emitter<SearchDeficiencyState> emit) async {
    emit(SearchDeficiencyLoading());

    final response =
        await _getListSearchDeficiency(SearchParams(keyword: event.keyword));
    response.fold(
      (l) => emit(SearchDeficiencyFailure(l.message)),
      (r) => emit(SearchListDeficiencySuccess(data: r)),
    );
  }

  FutureOr<void> onPaginateSearchDeficiencyEvent(
      PaginateSearchDeficiencyEvent event,
      Emitter<SearchDeficiencyState> emit) async {
    final state = this.state;

    if (state is SearchListDeficiencySuccess &&
        state.data.listResponse.next != null) {
      emit(state.copyWith(isPaginate: true));
      final response = await _getListSearchDeficiency(SearchParams(
        keyword: event.keyword,
        next: state.data.listResponse.next,
        previous: state.data.listResponse.previous,
      ));

      response.fold(
        (l) => emit(SearchDeficiencyFailure(l.message)),
        (r) => emit(SearchListDeficiencySuccess(
          data: r.copyWith(
            results: [
              ...state.data.results,
              ...r.results,
            ],
          ),
        )),
      );
    }
  }
}
