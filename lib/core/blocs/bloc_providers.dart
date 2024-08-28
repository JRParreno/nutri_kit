import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nutri_kit/core/common/cubits/cubit/app_user_cubit.dart';
import 'package:nutri_kit/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:nutri_kit/features/deficiency/presentation/bloc/deficiency_detail_bloc.dart';
import 'package:nutri_kit/features/food/presentation/bloc/food_detail_bloc.dart';
import 'package:nutri_kit/features/home/presentation/bloc/trivia_bloc/trivia_bloc.dart';
import 'package:nutri_kit/features/meal/presentation/blocs/child_health_list/child_health_list_bloc.dart';
import 'package:nutri_kit/features/meal/presentation/blocs/create_child_health_form/create_child_health_form_bloc.dart';
import 'package:nutri_kit/features/profile/presentation/bloc/update_profile_bloc.dart';
import 'package:nutri_kit/features/remedy/presentation/bloc/remedy_detail_bloc.dart';
import 'package:nutri_kit/features/search/presentation/blocs/search/search_bloc.dart';

class BlocProviders {
  static blocs(GetIt serviceLocator) {
    return [
      BlocProvider(
        create: (context) => serviceLocator<AppUserCubit>(),
      ),
      BlocProvider(
        create: (context) => serviceLocator<AuthBloc>(),
      ),
      BlocProvider(
        create: (context) => serviceLocator<TriviaBloc>(),
      ),
      BlocProvider(
        create: (context) => serviceLocator<SearchBloc>(),
      ),
      BlocProvider(
        create: (context) => serviceLocator<UpdateProfileBloc>(),
      ),
      BlocProvider(
        create: (context) => serviceLocator<RemedyDetailBloc>(),
      ),
      BlocProvider(
        create: (context) => serviceLocator<FoodDetailBloc>(),
      ),
      BlocProvider(
        create: (context) => serviceLocator<DeficiencyDetailBloc>(),
      ),
      BlocProvider(
        create: (context) => serviceLocator<ChildHealthListBloc>(),
      ),
      BlocProvider(
        create: (context) => serviceLocator<CreateChildHealthFormBloc>(),
      ),
    ];
  }
}
