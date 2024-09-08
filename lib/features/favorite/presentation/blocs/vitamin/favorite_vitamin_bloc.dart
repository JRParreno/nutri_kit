import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_kit/core/usecase/usecase.dart';
import 'package:nutri_kit/features/favorite/domain/usecase/index.dart';
import 'package:nutri_kit/features/search/domain/entities/index.dart';

part 'favorite_vitamin_event.dart';
part 'favorite_vitamin_state.dart';

class FavoriteVitaminBloc
    extends Bloc<FavoriteVitaminEvent, FavoriteVitaminState> {
  final GetListFavoriteVitamin _getListFavoriteVitamin;

  FavoriteVitaminBloc(GetListFavoriteVitamin getListFavoriteVitamin)
      : _getListFavoriteVitamin = getListFavoriteVitamin,
        super(FavoriteVitaminInitial()) {
    on<GetFavoriteVitaminEvent>(onGetFavoriteVitaminEvent);
    on<PaginateFavoriteVitaminEvent>(onPaginateFavoriteVitaminEvent);
  }

  FutureOr<void> onGetFavoriteVitaminEvent(
      GetFavoriteVitaminEvent event, Emitter<FavoriteVitaminState> emit) async {
    emit(FavoriteVitaminLoading());

    final response = await _getListFavoriteVitamin(const ListParams());
    response.fold(
      (l) => emit(FavoriteVitaminFailure(l.message)),
      (r) => emit(FavoriteVitaminSuccess(data: r)),
    );
  }

  FutureOr<void> onPaginateFavoriteVitaminEvent(
      PaginateFavoriteVitaminEvent event,
      Emitter<FavoriteVitaminState> emit) async {
    final state = this.state;

    if (state is FavoriteVitaminSuccess &&
        state.data.listResponse.next != null) {
      emit(state.copyWith(isPaginate: true));
      final response = await _getListFavoriteVitamin(ListParams(
        next: state.data.listResponse.next,
        previous: state.data.listResponse.previous,
      ));

      response.fold(
        (l) => emit(FavoriteVitaminFailure(l.message)),
        (r) => emit(FavoriteVitaminSuccess(
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
