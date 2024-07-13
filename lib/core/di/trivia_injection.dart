import 'package:get_it/get_it.dart';
import 'package:nutri_kit/features/home/data/datasources/trivia_remote_data_source.dart';
import 'package:nutri_kit/features/home/data/repositories/trivia_repository_impl.dart';
import 'package:nutri_kit/features/home/domain/repository/trivia_repository.dart';
import 'package:nutri_kit/features/home/domain/usecase/get_trivia_list.dart';
import 'package:nutri_kit/features/home/presentation/bloc/trivia_bloc/trivia_bloc.dart';

void initTrivia(GetIt serviceLocator) {
  // Datasource
  serviceLocator
    ..registerFactory<TriviaRemoteDataSource>(
      () => TriviaRemoteDataSourceImpl(),
    )
    // Repository
    ..registerFactory<TriviaRepository>(
      () => TriviaRepositoryImpl(serviceLocator()),
    )
    // Usecase
    ..registerFactory(
      () => GetTriviaList(serviceLocator()),
    )
    // Bloc
    ..registerFactory(
      () => TriviaBloc(getTriviaList: serviceLocator()),
    );
}
