import 'package:get_it/get_it.dart';
import 'package:nutri_kit/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:nutri_kit/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:nutri_kit/features/profile/domain/repository/profile_repository.dart';
import 'package:nutri_kit/features/profile/domain/usecase/index.dart';
import 'package:nutri_kit/features/profile/presentation/bloc/update_profile_bloc.dart';

void initUpdateProfile(GetIt serviceLocator) {
  // Datasource
  serviceLocator
    ..registerFactory<ProfileRemoteDataSource>(
      () => ProfileRemoteDataSourceImpl(),
    )
    // Repository
    ..registerFactory<ProfileRepository>(
      () => ProfileRepositoryImpl(serviceLocator()),
    )
    // Usecase
    ..registerFactory(() => UpdateProfile(serviceLocator()))
    ..registerFactory(() => UpdatePhoto(serviceLocator()))
    // Bloc
    ..registerFactory(
      () => UpdateProfileBloc(
        appUserCubit: serviceLocator(),
        updateProfile: serviceLocator(),
        updatePhoto: serviceLocator(),
      ),
    );
}
