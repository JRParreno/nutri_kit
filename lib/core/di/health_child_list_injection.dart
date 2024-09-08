import 'package:get_it/get_it.dart';
import 'package:nutri_kit/features/meal/data/datasources/meal_remote_data_source.dart';
import 'package:nutri_kit/features/meal/data/repositories/meal_repository_impl.dart';
import 'package:nutri_kit/features/meal/domain/repository/meal_repository.dart';
import 'package:nutri_kit/features/meal/domain/usecase/index.dart';
import 'package:nutri_kit/features/meal/presentation/blocs/child_health_list/child_health_list_bloc.dart';
import 'package:nutri_kit/features/meal/presentation/blocs/create_child_health_form/create_child_health_form_bloc.dart';
import 'package:nutri_kit/features/meal/presentation/blocs/meal_plan_detail/meal_plan_detail_bloc.dart';

void initHealthChildList(GetIt serviceLocator) {
  // datasources
  serviceLocator
    ..registerFactory<MealRemoteDataSource>(
      () => MealRemoteDataSourceImpl(),
    )
    // repositories
    ..registerFactory<MealRepository>(
      () => MealRepositoryImpl(serviceLocator()),
    )
    // usecases
    ..registerFactory(() => GetChildList(serviceLocator()))
    ..registerFactory(() => CreateChildHealthForm(serviceLocator()))
    ..registerFactory(() => GetChildMealPlanDetail(serviceLocator()))
    ..registerFactory(() => UpdateDayMealCompletionComplete(serviceLocator()))
    ..registerFactory(() => DeleteUserMealPlan(serviceLocator()))
    // bloc
    ..registerFactory(() => ChildHealthListBloc(serviceLocator()))
    ..registerFactory(
      () => MealPlanDetailBloc(
        getChildMealPlanDetail: serviceLocator(),
        updateDayMealCompletionComplete: serviceLocator(),
        deleteUserMealPlan: serviceLocator(),
      ),
    )
    ..registerFactory(() => CreateChildHealthFormBloc(serviceLocator()));
}
