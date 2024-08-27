import 'package:get_it/get_it.dart';
import 'package:nutri_kit/features/deficiency/data/datasources/deficiency_remote_data_source.dart';
import 'package:nutri_kit/features/deficiency/data/repository/deficiency_repository_impl.dart';
import 'package:nutri_kit/features/deficiency/domain/repository/deficiency_repository.dart';
import 'package:nutri_kit/features/deficiency/domain/usecase/get_deficiency_detail.dart';
import 'package:nutri_kit/features/deficiency/presentation/bloc/deficiency_detail_bloc.dart';

void initDeficiency(GetIt serviceLocator) {
  // datasources
  serviceLocator
    ..registerFactory<DeficiencyRemoteDataSource>(
      () => DeficiencyRemoteDataSourceImpl(),
    )
    // repository
    ..registerFactory<DeficiencyRepository>(
      () => DeficiencyRepositoryImpl(serviceLocator()),
    )
    // usecase
    ..registerFactory(
      () => GetDeficiencyDetail(serviceLocator()),
    )
    // bloc
    ..registerFactory(
      () => DeficiencyDetailBloc(serviceLocator()),
    );
}
