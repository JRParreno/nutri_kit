import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_kit/features/remedy/domain/entities/index.dart';
import 'package:nutri_kit/features/remedy/domain/usecase/index.dart';

part 'remedy_detail_event.dart';
part 'remedy_detail_state.dart';

class RemedyDetailBloc extends Bloc<RemedyDetailEvent, RemedyDetailState> {
  final GetRemedyDetail _getRemedyDetail;
  final DeleteFavoriteRemedy _deleteFavoriteRemedy;
  final AddFavoriteRemedy _addFavoriteRemedy;

  RemedyDetailBloc({
    required GetRemedyDetail getRemedyDetail,
    required DeleteFavoriteRemedy deleteFavoriteRemedy,
    required AddFavoriteRemedy addFavoriteRemedy,
  })  : _getRemedyDetail = getRemedyDetail,
        _deleteFavoriteRemedy = deleteFavoriteRemedy,
        _addFavoriteRemedy = addFavoriteRemedy,
        super(RemedyDetailInitial()) {
    on<GetRemedyDetailEvent>(onGetRemedyDetailEvent);
    on<AddFavoriteRemedyEvent>(onAddFavoriteRemedyEvent);
    on<DeleteFavoriteRemedyEvent>(onDeleteFavoriteRemedyEvent);
  }

  Future<void> onGetRemedyDetailEvent(
      GetRemedyDetailEvent event, Emitter<RemedyDetailState> emit) async {
    emit(RemedyDetailLoading());

    final response =
        await _getRemedyDetail.call(GetRemedyDetailParams(event.id));

    response.fold(
      (l) => emit(RemedyDetailFailure(l.message)),
      (r) => emit(RemedyDetailSuccess(remedyDetailEntity: r)),
    );
  }

  FutureOr<void> onAddFavoriteRemedyEvent(
      AddFavoriteRemedyEvent event, Emitter<RemedyDetailState> emit) async {
    final state = this.state;

    if (state is RemedyDetailSuccess) {
      emit(RemedyDetailLoading());

      final response = await _addFavoriteRemedy(
          AddFavoriteRemedyParams(state.remedyDetailEntity.id));

      response.fold(
        (l) => emit(RemedyDetailFailure(l.message)),
        (r) => emit(
          RemedyDetailSuccess(
            remedyDetailEntity: state.remedyDetailEntity.copyWith(
              isFavorite: true,
            ),
            message: r,
          ),
        ),
      );
    }
  }

  FutureOr<void> onDeleteFavoriteRemedyEvent(
      DeleteFavoriteRemedyEvent event, Emitter<RemedyDetailState> emit) async {
    final state = this.state;

    if (state is RemedyDetailSuccess) {
      emit(RemedyDetailLoading());

      final response = await _deleteFavoriteRemedy(
          DeleteFavoriteRemedyParams(state.remedyDetailEntity.id));

      response.fold(
        (l) => emit(RemedyDetailFailure(l.message)),
        (r) => emit(
          RemedyDetailSuccess(
            remedyDetailEntity: state.remedyDetailEntity.copyWith(
              isFavorite: false,
            ),
            message: r,
          ),
        ),
      );
    }
  }
}
