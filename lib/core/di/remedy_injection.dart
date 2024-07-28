import 'package:get_it/get_it.dart';
import 'package:nutri_kit/features/remedy/data/datasources/remedy_remote_data_source.dart';
import 'package:nutri_kit/features/remedy/data/repositories/remedy_repository_impl.dart';
import 'package:nutri_kit/features/remedy/domain/repository/remedy_repository.dart';
import 'package:nutri_kit/features/remedy/domain/usecase/get_remedy_detail.dart';
import 'package:nutri_kit/features/remedy/presentation/bloc/remedy_detail_bloc.dart';

void initRemedy(GetIt serviceLocator) {
  // datasources
  serviceLocator
    ..registerFactory<RemedyRemoteDataSource>(
      () => RemedyRemoteDataSourceImpl(),
    )
    // repositories
    ..registerFactory<RemedyRepository>(
      () => RemedyRepositoryImpl(serviceLocator()),
    )
    // usecases
    ..registerFactory(() => GetRemedyDetail(serviceLocator()))
    // bloc
    ..registerFactory(() => RemedyDetailBloc(serviceLocator()));
}
