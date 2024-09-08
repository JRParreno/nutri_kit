import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_kit/core/usecase/usecase.dart';
import 'package:nutri_kit/features/search/domain/entities/index.dart';
import 'package:nutri_kit/features/search/domain/usecase/search_food.dart';

part 'search_food_event.dart';
part 'search_food_state.dart';

class SearchFoodBloc extends Bloc<SearchFoodEvent, SearchFoodState> {
  final SearchFood _getListSearchFood;

  SearchFoodBloc(SearchFood getListSearchFood)
      : _getListSearchFood = getListSearchFood,
        super(SearchFoodInitial()) {
    on<GetSearchFoodEvent>(onGetSearchFoodEvent);
    on<PaginateSearchFoodEvent>(onPaginateSearchFoodEvent);
  }

  FutureOr<void> onGetSearchFoodEvent(
      GetSearchFoodEvent event, Emitter<SearchFoodState> emit) async {
    emit(SearchFoodLoading());

    final response =
        await _getListSearchFood(SearchParams(keyword: event.keyword));
    response.fold(
      (l) => emit(SearchFoodFailure(l.message)),
      (r) => emit(SearchListFoodSuccess(data: r)),
    );
  }

  FutureOr<void> onPaginateSearchFoodEvent(
      PaginateSearchFoodEvent event, Emitter<SearchFoodState> emit) async {
    final state = this.state;

    if (state is SearchListFoodSuccess &&
        state.data.listResponse.next != null) {
      emit(state.copyWith(isPaginate: true));
      final response = await _getListSearchFood(SearchParams(
        keyword: event.keyword,
        next: state.data.listResponse.next,
        previous: state.data.listResponse.previous,
      ));

      response.fold(
        (l) => emit(SearchFoodFailure(l.message)),
        (r) => emit(SearchListFoodSuccess(
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
