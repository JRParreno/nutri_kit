import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_kit/features/remedy/domain/entities/index.dart';
import 'package:nutri_kit/features/remedy/domain/usecase/get_remedy_detail.dart';

part 'remedy_detail_event.dart';
part 'remedy_detail_state.dart';

class RemedyDetailBloc extends Bloc<RemedyDetailEvent, RemedyDetailState> {
  final GetRemedyDetail _getRemedyDetail;

  RemedyDetailBloc(GetRemedyDetail getRemedyDetail)
      : _getRemedyDetail = getRemedyDetail,
        super(RemedyDetailInitial()) {
    on<GetRemedyDetailEvent>(onGetRemedyDetailEvent);
    on<AddRemedyDetailEvent>(onAddRemedyDetailEvent);
  }

  Future<void> onGetRemedyDetailEvent(
      GetRemedyDetailEvent event, Emitter<RemedyDetailState> emit) async {
    emit(RemedyDetailLoading());

    final response =
        await _getRemedyDetail.call(GetRemedyDetailParams(event.id));

    response.fold(
      (l) => emit(RemedyDetailFailure(l.message)),
      (r) => emit(RemedyDetailSuccess(r)),
    );
  }

  Future<void> onAddRemedyDetailEvent(
      AddRemedyDetailEvent event, Emitter<RemedyDetailState> emit) async {}
}
