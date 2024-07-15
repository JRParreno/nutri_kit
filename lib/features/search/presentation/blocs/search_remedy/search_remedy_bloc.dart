import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_remedy_event.dart';
part 'search_remedy_state.dart';

class SearchRemedyBloc extends Bloc<SearchRemedyEvent, SearchRemedyState> {
  SearchRemedyBloc() : super(SearchRemedyInitial()) {
    on<SearchRemedyEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
