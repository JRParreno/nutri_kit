import 'package:get_it/get_it.dart';
import 'package:nutri_kit/features/favorite/data/datasource/favorite_remote_data_source.dart';
import 'package:nutri_kit/features/favorite/data/repository/favorite_repository_impl.dart';
import 'package:nutri_kit/features/favorite/domain/repository/favorite_repository.dart';
import 'package:nutri_kit/features/favorite/domain/usecase/index.dart';
import 'package:nutri_kit/features/favorite/presentation/blocs/deficiency/favorite_deficiency_bloc.dart';
import 'package:nutri_kit/features/favorite/presentation/blocs/remedy/favorite_remedy_bloc.dart';

void initFavorite(GetIt serviceLocator) {
  // datasources
  serviceLocator
    ..registerFactory<FavoriteRemoteDataSource>(
      () => FavoriteRemoteDataSourceImpl(),
    )
    // repository
    ..registerFactory<FavoriteRepository>(
      () => FavoriteRepositoryImpl(serviceLocator()),
    )
    // usecase
    ..registerFactory(
      () => GetListFavoriteDeficiency(serviceLocator()),
    )
    ..registerFactory(
      () => GetListFavoriteRemedy(serviceLocator()),
    )
    // bloc
    ..registerFactory(
      () => FavoriteDeficiencyBloc(serviceLocator()),
    )
    ..registerFactory(
      () => FavoriteRemedyBloc(serviceLocator()),
    );
}
