import 'package:get_it/get_it.dart';
import 'package:nutri_kit/core/common/cubits/cubit/app_user_cubit.dart';
import 'package:nutri_kit/core/local_storage/shared_preferences_service.dart';
import 'package:nutri_kit/core/notifier/shared_preferences_notifier.dart';
import 'package:nutri_kit/core/service/env_service.dart';
import 'package:nutri_kit/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:nutri_kit/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:nutri_kit/features/auth/domain/repository/auth_repository.dart';
import 'package:nutri_kit/features/auth/domain/usecase/current_user.dart';

import 'package:nutri_kit/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/auth/domain/usecase/index.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  // set authentication feature
  initAuth();
  // set env service
  await EnvService.init();
  // Shared preferences
  await setupSharedPreferencesDependencies();

  serviceLocator.registerLazySingleton(() => AppUserCubit());
}

void initAuth() {
  serviceLocator
    // Datasource
    ..registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(),
    )
    // Repository
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(serviceLocator()),
    )
    // Usecase
    ..registerFactory(
      () => UserSignup(serviceLocator()),
    )
    ..registerFactory(
      () => UserLogin(serviceLocator()),
    )
    ..registerFactory(
      () => CurrentUser(serviceLocator()),
    )
    // Bloc
    ..registerFactory(
      () => AuthBloc(
        currentUser: serviceLocator(),
        userLogin: serviceLocator(),
        userSignup: serviceLocator(),
        sharedPreferencesNotifier: serviceLocator(),
        appUserCubit: serviceLocator(),
      ),
    );
}

Future<void> setupSharedPreferencesDependencies() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  final sharedPreferencesService = SharedPreferencesService(sharedPreferences);
  final sharedPreferencesNotifier =
      SharedPreferencesNotifier(sharedPreferencesService);

  serviceLocator.registerLazySingleton<SharedPreferencesService>(
      () => sharedPreferencesService);
  serviceLocator.registerLazySingleton<SharedPreferencesNotifier>(
      () => sharedPreferencesNotifier);
}
