import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_kit/core/usecase/usecase.dart';
import 'package:nutri_kit/features/favorite/domain/usecase/index.dart';
import 'package:nutri_kit/features/search/domain/entities/index.dart';

part 'favorite_deficiency_event.dart';
part 'favorite_deficiency_state.dart';

class FavoriteDeficiencyBloc
    extends Bloc<FavoriteDeficiencyEvent, FavoriteDeficiencyState> {
  final GetListFavoriteDeficiency _getListFavoriteDeficiency;

  FavoriteDeficiencyBloc(GetListFavoriteDeficiency getListFavoriteDeficiency)
      : _getListFavoriteDeficiency = getListFavoriteDeficiency,
        super(FavoriteDeficiencyInitial()) {
    on<GetFavoriteDeficiencyEvent>(onGetFavoriteDeficiencyEvent);
    on<PaginateFavoriteDeficiencyEvent>(onPaginateFavoriteDeficiencyEvent);
  }

  FutureOr<void> onGetFavoriteDeficiencyEvent(GetFavoriteDeficiencyEvent event,
      Emitter<FavoriteDeficiencyState> emit) async {
    emit(FavoriteDeficiencyLoading());

    final response = await _getListFavoriteDeficiency(const ListParams());
    response.fold(
      (l) => emit(FavoriteDeficiencyFailure(l.message)),
      (r) => emit(FavoriteDeficiencySuccess(data: r)),
    );
  }

  FutureOr<void> onPaginateFavoriteDeficiencyEvent(
      PaginateFavoriteDeficiencyEvent event,
      Emitter<FavoriteDeficiencyState> emit) async {
    final state = this.state;

    if (state is FavoriteDeficiencySuccess &&
        state.data.listResponse.next != null) {
      emit(state.copyWith(isPaginate: true));
      final response = await _getListFavoriteDeficiency(ListParams(
        next: state.data.listResponse.next,
        previous: state.data.listResponse.previous,
      ));

      response.fold(
        (l) => emit(FavoriteDeficiencyFailure(l.message)),
        (r) => emit(FavoriteDeficiencySuccess(
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
