import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_food_event.dart';
part 'search_food_state.dart';

class SearchFoodBloc extends Bloc<SearchFoodEvent, SearchFoodState> {
  SearchFoodBloc() : super(SearchFoodInitial()) {
    on<SearchFoodEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
