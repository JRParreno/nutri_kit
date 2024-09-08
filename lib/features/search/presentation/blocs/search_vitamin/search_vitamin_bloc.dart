import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_kit/core/usecase/usecase.dart';
import 'package:nutri_kit/features/search/domain/entities/index.dart';
import 'package:nutri_kit/features/search/domain/usecase/search_vitamin.dart';

part 'search_vitamin_event.dart';
part 'search_vitamin_state.dart';

class SearchVitaminBloc extends Bloc<SearchVitaminEvent, SearchVitaminState> {
  final SearchVitamin _getListSearchVitamin;

  SearchVitaminBloc(SearchVitamin getListSearchVitamin)
      : _getListSearchVitamin = getListSearchVitamin,
        super(SearchVitaminInitial()) {
    on<GetSearchVitaminEvent>(onGetSearchVitaminEvent);
    on<PaginateSearchVitaminEvent>(onPaginateSearchVitaminEvent);
  }

  FutureOr<void> onGetSearchVitaminEvent(
      GetSearchVitaminEvent event, Emitter<SearchVitaminState> emit) async {
    emit(SearchVitaminLoading());

    final response =
        await _getListSearchVitamin(SearchParams(keyword: event.keyword));
    response.fold(
      (l) => emit(SearchVitaminFailure(l.message)),
      (r) => emit(SearchListVitaminSuccess(data: r)),
    );
    return null;
  }

  FutureOr<void> onPaginateSearchVitaminEvent(PaginateSearchVitaminEvent event,
      Emitter<SearchVitaminState> emit) async {
    final state = this.state;

    if (state is SearchListVitaminSuccess &&
        state.data.listResponse.next != null) {
      emit(state.copyWith(isPaginate: true));
      final response = await _getListSearchVitamin(SearchParams(
        keyword: event.keyword,
        next: state.data.listResponse.next,
        previous: state.data.listResponse.previous,
      ));

      response.fold(
        (l) => emit(SearchVitaminFailure(l.message)),
        (r) => emit(SearchListVitaminSuccess(
          data: r.copyWith(
            results: [
              ...state.data.results,
              ...r.results,
            ],
          ),
        )),
      );
    }
    return null;
  }
}
