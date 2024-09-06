import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_kit/core/usecase/usecase.dart';
import 'package:nutri_kit/features/favorite/domain/usecase/index.dart';
import 'package:nutri_kit/features/search/domain/entities/index.dart';

part 'favorite_remedy_event.dart';
part 'favorite_remedy_state.dart';

class FavoriteRemedyBloc
    extends Bloc<FavoriteRemedyEvent, FavoriteRemedyState> {
  final GetListFavoriteRemedy _getListFavoriteRemedy;

  FavoriteRemedyBloc(GetListFavoriteRemedy getListFavoriteRemedy)
      : _getListFavoriteRemedy = getListFavoriteRemedy,
        super(FavoriteRemedyInitial()) {
    on<GetFavoriteRemedyEvent>(onGetFavoriteRemedyEvent);
    on<PaginateFavoriteRemedyEvent>(onPaginateFavoriteRemedyEvent);
  }

  FutureOr<void> onGetFavoriteRemedyEvent(
      GetFavoriteRemedyEvent event, Emitter<FavoriteRemedyState> emit) async {
    emit(FavoriteRemedyLoading());

    final response = await _getListFavoriteRemedy(const ListParams());

    response.fold(
      (l) => emit(FavoriteRemedyFailure(l.message)),
      (r) => emit(FavoriteRemedySuccess(data: r)),
    );
  }

  FutureOr<void> onPaginateFavoriteRemedyEvent(
      PaginateFavoriteRemedyEvent event,
      Emitter<FavoriteRemedyState> emit) async {
    final state = this.state;

    if (state is FavoriteRemedySuccess &&
        state.data.listResponse.next != null) {
      emit(state.copyWith(isPaginate: true));
      final response = await _getListFavoriteRemedy(ListParams(
        next: state.data.listResponse.next,
        previous: state.data.listResponse.previous,
      ));

      response.fold(
        (l) => emit(FavoriteRemedyFailure(l.message)),
        (r) => emit(FavoriteRemedySuccess(
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
