import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_kit/features/deficiency/domain/entities/deficiency_detail_entity.dart';
import 'package:nutri_kit/features/deficiency/domain/usecase/get_deficiency_detail.dart';

part 'deficiency_detail_event.dart';
part 'deficiency_detail_state.dart';

class DeficiencyDetailBloc
    extends Bloc<DeficiencyDetailEvent, DeficiencyDetailState> {
  final GetDeficiencyDetail _getDeficiencyDetail;

  DeficiencyDetailBloc(GetDeficiencyDetail getDeficiencyDetail)
      : _getDeficiencyDetail = getDeficiencyDetail,
        super(DeficiencyDetailInitial()) {
    on<GetDeficiencyDetailEvent>(onGetDeficiencyDetailEvent);
  }

  FutureOr<void> onGetDeficiencyDetailEvent(GetDeficiencyDetailEvent event,
      Emitter<DeficiencyDetailState> emit) async {
    emit(DeficiencyDetailLoading());

    final response =
        await _getDeficiencyDetail(GetDeficiencyDetailParams(event.id));

    response.fold(
      (l) => emit(DeficiencyDetailFailure(l.message)),
      (r) => emit(DeficiencyDetailSuccess(r)),
    );
  }
}
