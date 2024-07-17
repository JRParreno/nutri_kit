import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:nutri_kit/core/config/shared_prefences_keys.dart';
import 'package:nutri_kit/core/error/failure.dart';
import 'package:nutri_kit/core/notifier/shared_preferences_notifier.dart';
import 'package:nutri_kit/features/search/domain/entities/index.dart';
import 'package:nutri_kit/features/search/domain/usecase/search_deficiency.dart';
import 'package:nutri_kit/features/search/domain/usecase/search_food.dart';
import 'package:nutri_kit/features/search/domain/usecase/search_remedy.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SharedPreferencesNotifier _sharedPreferencesNotifier;
  final SearchFood _searchFood;
  final SearchRemedy _searchRemedy;
  final SearchDeficiency _searchDeficiency;

  SearchBloc({
    required SharedPreferencesNotifier sharedPreferencesNotifier,
    required SearchFood searchFood,
    required SearchRemedy searchRemedy,
    required SearchDeficiency searchDeficiency,
  })  : _sharedPreferencesNotifier = sharedPreferencesNotifier,
        _searchFood = searchFood,
        _searchRemedy = searchRemedy,
        _searchDeficiency = searchDeficiency,
        super(SearchInitial()) {
    on<SearchGetRecentSearches>(onSearchGetRecentSearches);
    on<SearchTriggerEvent>(onSearchTriggerEvent);
  }

  void onSearchGetRecentSearches(
      SearchGetRecentSearches event, Emitter<SearchState> emit) {
    final recentSearches = _sharedPreferencesNotifier.getValue(
        SharedPreferencesKeys.recentSearches, [] as List<String>);

    emit(SearchRecentLoaded(recentSearches));
  }

  Future<void> onSearchTriggerEvent(
      SearchTriggerEvent event, Emitter<SearchState> emit) async {
    emit(SearchLoading());

    final deficiencyResponse = _searchDeficiency.call(
      SearchDeficiencyParams(keyword: event.keyword),
    );
    final remedyResponse = _searchRemedy.call(
      SearchRemedyParams(keyword: event.keyword),
    );
    final foodResponse = _searchFood.call(
      SearchFoodParams(keyword: event.keyword),
    );

    final results = await Future.wait([
      deficiencyResponse,
      remedyResponse,
      foodResponse,
    ]);

    final deficiencyResult = results[0] as Either<Failure, DeficiencyResponse>;
    final remedyResult = results[1] as Either<Failure, RemediesResponse>;
    final foodResult = results[2] as Either<Failure, FoodResponse>;

    if (deficiencyResult.isLeft() &&
        remedyResult.isLeft() &&
        foodResult.isLeft()) {
      emit(const SearchFailure('Something went wrong'));
      return;
    }

    emit(
      SearchSuccess(
        deficiencyResponse: deficiencyResult.fold((l) => null, (r) => r),
        remediesResponse: remedyResult.fold((l) => null, (r) => r),
        foodResponse: foodResult.fold((l) => null, (r) => r),
      ),
    );
  }
}
