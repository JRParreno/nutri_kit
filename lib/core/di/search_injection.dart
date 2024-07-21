import 'package:get_it/get_it.dart';
import 'package:nutri_kit/features/search/data/datasources/search_remote_data_source.dart';
import 'package:nutri_kit/features/search/data/repository/search_repository_impl.dart';
import 'package:nutri_kit/features/search/domain/repository/search_repository.dart';
import 'package:nutri_kit/features/search/domain/usecase/search_deficiency.dart';
import 'package:nutri_kit/features/search/domain/usecase/search_food.dart';
import 'package:nutri_kit/features/search/domain/usecase/search_remedy.dart';
import 'package:nutri_kit/features/search/domain/usecase/search_vitamin.dart';
import 'package:nutri_kit/features/search/presentation/blocs/search/search_bloc.dart';

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
    );
}
