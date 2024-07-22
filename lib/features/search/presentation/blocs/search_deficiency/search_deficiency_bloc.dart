import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_kit/features/deficiency/domain/entities/index.dart';

part 'search_deficiency_event.dart';
part 'search_deficiency_state.dart';

class SearchDeficiencyBloc
    extends Bloc<SearchDeficiencyEvent, SearchDeficiencyState> {
  SearchDeficiencyBloc() : super(SearchDeficiencyInitial()) {
    on<SearchDeficiencyEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
