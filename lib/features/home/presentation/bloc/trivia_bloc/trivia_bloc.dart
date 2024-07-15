import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_kit/features/home/domain/entities/index.dart';
import 'package:nutri_kit/features/home/domain/usecase/get_trivia_list.dart';

part 'trivia_event.dart';
part 'trivia_state.dart';

class TriviaBloc extends Bloc<TriviaEvent, TriviaState> {
  final GetTriviaList _getTriviaList;

  TriviaBloc({required GetTriviaList getTriviaList})
      : _getTriviaList = getTriviaList,
        super(TriviaInitial()) {
    on<TriviaGetList>(onTriviaGetList);
    on<TriviaPaginate>(onTriviaPaginate);
  }

  Future<void> onTriviaGetList(
      TriviaGetList event, Emitter<TriviaState> emit) async {
    emit(TriviaLoading());

    final response = await _getTriviaList(const GetTriviaListParams());

    response.fold(
      (l) => emit(TriviaFailure(l.message)),
      (r) => emit(TriviaLoaded(r)),
    );
  }

  Future<void> onTriviaPaginate(
      TriviaPaginate event, Emitter<TriviaState> emit) async {
    final state = this.state;

    if (state is TriviaLoaded) {
      final next = state.triviaResponse.listResponse.next;
      if (next == null) return;

      final response = await _getTriviaList(GetTriviaListParams(next: next));

      response.fold(
        (l) => emit(TriviaFailure(l.message)),
        (r) => emit(TriviaLoaded(r)),
      );
    }
  }
}
