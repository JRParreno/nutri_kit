import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_kit/features/deficiency/domain/entities/deficiency_detail_entity.dart';
import 'package:nutri_kit/features/deficiency/domain/usecase/index.dart';

part 'deficiency_detail_event.dart';
part 'deficiency_detail_state.dart';

class DeficiencyDetailBloc
    extends Bloc<DeficiencyDetailEvent, DeficiencyDetailState> {
  final GetDeficiencyDetail _getDeficiencyDetail;
  final DeleteFavoriteDeficiency _deleteFavoriteDeficiency;
  final AddFavoriteDeficiency _addFavoriteDeficiency;

  DeficiencyDetailBloc({
    required GetDeficiencyDetail getDeficiencyDetail,
    required DeleteFavoriteDeficiency deleteFavoriteDeficiency,
    required AddFavoriteDeficiency addFavoriteDeficiency,
  })  : _getDeficiencyDetail = getDeficiencyDetail,
        _deleteFavoriteDeficiency = deleteFavoriteDeficiency,
        _addFavoriteDeficiency = addFavoriteDeficiency,
        super(DeficiencyDetailInitial()) {
    on<GetDeficiencyDetailEvent>(onGetDeficiencyDetailEvent);
    on<AddFavoriteDeficiencyEvent>(onAddFavoriteDeficiencyEvent);
    on<DeleteFavoriteDeficiencyEvent>(onDeleteFavoriteDeficiencyEvent);
  }

  FutureOr<void> onGetDeficiencyDetailEvent(GetDeficiencyDetailEvent event,
      Emitter<DeficiencyDetailState> emit) async {
    emit(DeficiencyDetailLoading());

    final response =
        await _getDeficiencyDetail(GetDeficiencyDetailParams(event.id));

    response.fold(
      (l) => emit(DeficiencyDetailFailure(l.message)),
      (r) => emit(DeficiencyDetailSuccess(deficiencyDetailEntity: r)),
    );
  }

  FutureOr<void> onAddFavoriteDeficiencyEvent(AddFavoriteDeficiencyEvent event,
      Emitter<DeficiencyDetailState> emit) async {
    final state = this.state;

    if (state is DeficiencyDetailSuccess) {
      emit(DeficiencyDetailLoading());

      final response = await _addFavoriteDeficiency(
          AddFavoriteDeficiencyParams(state.deficiencyDetailEntity.id));

      response.fold(
        (l) => emit(DeficiencyDetailFailure(l.message)),
        (r) => emit(
          DeficiencyDetailSuccess(
            deficiencyDetailEntity: state.deficiencyDetailEntity.copyWith(
              isFavorite: true,
            ),
            message: r,
          ),
        ),
      );
    }
  }

  FutureOr<void> onDeleteFavoriteDeficiencyEvent(
      DeleteFavoriteDeficiencyEvent event,
      Emitter<DeficiencyDetailState> emit) async {
    final state = this.state;

    if (state is DeficiencyDetailSuccess) {
      emit(DeficiencyDetailLoading());

      final response = await _deleteFavoriteDeficiency(
          DeleteFavoriteDeficiencyParams(state.deficiencyDetailEntity.id));

      response.fold(
        (l) => emit(DeficiencyDetailFailure(l.message)),
        (r) => emit(
          DeficiencyDetailSuccess(
            deficiencyDetailEntity: state.deficiencyDetailEntity.copyWith(
              isFavorite: false,
            ),
            message: r,
          ),
        ),
      );
    }
  }
}
