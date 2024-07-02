import 'package:get_it/get_it.dart';
import 'package:nutri_kit/core/common/cubits/cubit/app_user_cubit.dart';
import 'package:nutri_kit/core/local_storage/shared_preferences_service.dart';
import 'package:nutri_kit/core/notifier/shared_preferences_notifier.dart';
import 'package:nutri_kit/core/service/env_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  serviceLocator.registerFactory(() => AppUserCubit());

  // set env service
  await EnvService.init();
  // Shared preferences
  await setupSharedPreferencesDependencies();
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
