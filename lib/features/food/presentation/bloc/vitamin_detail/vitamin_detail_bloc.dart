import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_kit/features/food/domain/entities/index.dart';
import 'package:nutri_kit/features/food/domain/usecase/index.dart';

part 'vitamin_detail_event.dart';
part 'vitamin_detail_state.dart';

class VitaminDetailBloc extends Bloc<VitaminDetailEvent, VitaminDetailState> {
  final GetVitaminDetail _getVitaminDetail;

  final DeleteFavoriteVitamin _deleteFavoriteVitamin;
  final AddFavoriteVitamin _addFavoriteVitamin;

  VitaminDetailBloc({
    required GetVitaminDetail getVitaminDetail,
    required DeleteFavoriteVitamin deleteFavoriteVitamin,
    required AddFavoriteVitamin addFavoriteVitamin,
  })  : _getVitaminDetail = getVitaminDetail,
        _deleteFavoriteVitamin = deleteFavoriteVitamin,
        _addFavoriteVitamin = addFavoriteVitamin,
        super(VitaminDetailInitial()) {
    on<GetVitaminDetailEvent>(onGetVitaminDetailEvent);
    on<AddFavoriteVitaminEvent>(onAddFavoriteVitaminEvent);
    on<DeleteFavoriteVitaminEvent>(onDeleteFavoriteVitaminEvent);
  }

  FutureOr<void> onGetVitaminDetailEvent(
      GetVitaminDetailEvent event, Emitter<VitaminDetailState> emit) async {
    emit(VitaminDetailLoading());

    final response =
        await _getVitaminDetail.call(GetVitaminDetailParams(event.id));

    response.fold(
      (l) => emit(VitaminDetailFailure(l.message)),
      (r) => emit(VitaminDetailSuccess(vitaminEntity: r)),
    );
  }

  FutureOr<void> onAddFavoriteVitaminEvent(
      AddFavoriteVitaminEvent event, Emitter<VitaminDetailState> emit) async {
    final state = this.state;

    if (state is VitaminDetailSuccess) {
      emit(VitaminDetailLoading());

      final response = await _addFavoriteVitamin(
          AddFavoriteVitaminParams(state.vitaminEntity.id));

      response.fold(
        (l) => emit(VitaminDetailFailure(l.message)),
        (r) => emit(
          VitaminDetailSuccess(
            vitaminEntity: state.vitaminEntity.copyWith(
              isFavorite: true,
            ),
            message: r,
          ),
        ),
      );
    }
  }

  FutureOr<void> onDeleteFavoriteVitaminEvent(DeleteFavoriteVitaminEvent event,
      Emitter<VitaminDetailState> emit) async {
    final state = this.state;

    if (state is VitaminDetailSuccess) {
      emit(VitaminDetailLoading());

      final response = await _deleteFavoriteVitamin(
          DeleteFavoriteVitaminParams(state.vitaminEntity.id));

      response.fold(
        (l) => emit(VitaminDetailFailure(l.message)),
        (r) => emit(
          VitaminDetailSuccess(
            vitaminEntity: state.vitaminEntity.copyWith(
              isFavorite: false,
            ),
            message: r,
          ),
        ),
      );
    }
  }
}
