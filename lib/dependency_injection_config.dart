import 'package:get_it/get_it.dart';
import 'package:nutri_kit/core/di/index.dart';
import 'package:nutri_kit/core/di/search_injection.dart';
import 'package:nutri_kit/core/di/update_profile_injection.dart';
import 'package:nutri_kit/core/service/env_service.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  // set authentication feature
  initAuth(serviceLocator);
  // set env service
  await EnvService.init();
  // Shared preferences
  await setupSharedPreferencesDependencies(serviceLocator);

  // set Trivia feature
  initTrivia(serviceLocator);
  // set Search feature
  initSearch(serviceLocator);
  // set Update profile feature
  initUpdateProfile(serviceLocator);
}
