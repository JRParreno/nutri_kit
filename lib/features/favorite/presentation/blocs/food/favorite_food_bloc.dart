import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_kit/core/usecase/usecase.dart';
import 'package:nutri_kit/features/favorite/domain/usecase/index.dart';
import 'package:nutri_kit/features/search/domain/entities/index.dart';

part 'favorite_food_event.dart';
part 'favorite_food_state.dart';

class FavoriteFoodBloc extends Bloc<FavoriteFoodEvent, FavoriteFoodState> {
  final GetListFavoriteFood _getListFavoriteFood;

  FavoriteFoodBloc(GetListFavoriteFood getListFavoriteFood)
      : _getListFavoriteFood = getListFavoriteFood,
        super(FavoriteFoodInitial()) {
    on<GetFavoriteFoodEvent>(onGetFavoriteFoodEvent);
    on<PaginateFavoriteFoodEvent>(onPaginateFavoriteFoodEvent);
  }

  FutureOr<void> onGetFavoriteFoodEvent(
      GetFavoriteFoodEvent event, Emitter<FavoriteFoodState> emit) async {
    emit(FavoriteFoodLoading());

    final response = await _getListFavoriteFood(const ListParams());
    response.fold(
      (l) => emit(FavoriteFoodFailure(l.message)),
      (r) => emit(FavoriteFoodSuccess(data: r)),
    );
  }

  FutureOr<void> onPaginateFavoriteFoodEvent(
      PaginateFavoriteFoodEvent event, Emitter<FavoriteFoodState> emit) async {
    final state = this.state;

    if (state is FavoriteFoodSuccess && state.data.listResponse.next != null) {
      emit(state.copyWith(isPaginate: true));
      final response = await _getListFavoriteFood(ListParams(
        next: state.data.listResponse.next,
        previous: state.data.listResponse.previous,
      ));

      response.fold(
        (l) => emit(FavoriteFoodFailure(l.message)),
        (r) => emit(FavoriteFoodSuccess(
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
