import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_kit/core/usecase/usecase.dart';
import 'package:nutri_kit/features/search/domain/entities/index.dart';
import 'package:nutri_kit/features/search/domain/usecase/search_remedy.dart';

part 'search_remedy_event.dart';
part 'search_remedy_state.dart';

class SearchRemedyBloc extends Bloc<SearchRemedyEvent, SearchRemedyState> {
  final SearchRemedy _getListSearchRemedy;

  SearchRemedyBloc(SearchRemedy getListSearchRemedy)
      : _getListSearchRemedy = getListSearchRemedy,
        super(SearchRemedyInitial()) {
    on<GetSearchRemedyEvent>(onGetSearchRemedyEvent);
    on<PaginateSearchRemedyEvent>(onPaginateSearchRemedyEvent);
  }

  FutureOr<void> onGetSearchRemedyEvent(
      GetSearchRemedyEvent event, Emitter<SearchRemedyState> emit) async {
    emit(SearchRemedyLoading());

    final response =
        await _getListSearchRemedy(SearchParams(keyword: event.keyword));
    response.fold(
      (l) => emit(SearchRemedyFailure(l.message)),
      (r) => emit(SearchListRemedySuccess(data: r)),
    );
  }

  FutureOr<void> onPaginateSearchRemedyEvent(
      PaginateSearchRemedyEvent event, Emitter<SearchRemedyState> emit) async {
    final state = this.state;

    if (state is SearchListRemedySuccess &&
        state.data.listResponse.next != null) {
      emit(state.copyWith(isPaginate: true));
      final response = await _getListSearchRemedy(SearchParams(
        keyword: event.keyword,
        next: state.data.listResponse.next,
        previous: state.data.listResponse.previous,
      ));

      response.fold(
        (l) => emit(SearchRemedyFailure(l.message)),
        (r) => emit(SearchListRemedySuccess(
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
