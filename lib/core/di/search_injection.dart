import 'package:get_it/get_it.dart';
import 'package:nutri_kit/features/search/data/datasources/search_remote_data_source.dart';
import 'package:nutri_kit/features/search/data/repository/search_repository_impl.dart';
import 'package:nutri_kit/features/search/domain/repository/search_repository.dart';
import 'package:nutri_kit/features/search/domain/usecase/search_deficiency.dart';
import 'package:nutri_kit/features/search/domain/usecase/search_food.dart';
import 'package:nutri_kit/features/search/domain/usecase/search_remedy.dart';
import 'package:nutri_kit/features/search/domain/usecase/search_vitamin.dart';
import 'package:nutri_kit/features/search/presentation/blocs/search/search_bloc.dart';
import 'package:nutri_kit/features/search/presentation/blocs/search_deficiency/search_deficiency_bloc.dart';
import 'package:nutri_kit/features/search/presentation/blocs/search_food/search_food_bloc.dart';
import 'package:nutri_kit/features/search/presentation/blocs/search_remedy/search_remedy_bloc.dart';
import 'package:nutri_kit/features/search/presentation/blocs/search_vitamin/search_vitamin_bloc.dart';

void initSearch(GetIt serviceLocator) {
  // Datasource
  serviceLocator
    ..registerFactory<SearchRemoteDataSource>(
        () => SearchRemoteDataSourceImpl())
// Repository
    ..registerFactory<SearchRepository>(
        () => SearchRepositoryImpl(serviceLocator()))
// Usacase
    ..registerFactory(() => SearchRemedy(serviceLocator()))
    ..registerFactory(() => SearchDeficiency(serviceLocator()))
    ..registerFactory(() => SearchFood(serviceLocator()))
    ..registerFactory(() => SearchVitamin(serviceLocator()))

// Blocs
    ..registerFactory(
      () => SearchBloc(
        sharedPreferencesNotifier: serviceLocator(),
        searchFood: serviceLocator(),
        searchRemedy: serviceLocator(),
        searchDeficiency: serviceLocator(),
        searchVitamin: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => SearchDeficiencyBloc(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => SearchRemedyBloc(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => SearchFoodBloc(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => SearchVitaminBloc(
        serviceLocator(),
      ),
    );
}
