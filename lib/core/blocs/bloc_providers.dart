import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nutri_kit/core/common/cubits/cubit/app_user_cubit.dart';
import 'package:nutri_kit/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:nutri_kit/features/change_password/data/blocs/bloc/change_password_bloc.dart';
import 'package:nutri_kit/features/change_password/data/repository/change_password_repository_impl.dart';
import 'package:nutri_kit/features/deficiency/presentation/bloc/deficiency_detail_bloc.dart';
import 'package:nutri_kit/features/favorite/presentation/blocs/deficiency/favorite_deficiency_bloc.dart';
import 'package:nutri_kit/features/favorite/presentation/blocs/food/favorite_food_bloc.dart';
import 'package:nutri_kit/features/favorite/presentation/blocs/remedy/favorite_remedy_bloc.dart';
import 'package:nutri_kit/features/favorite/presentation/blocs/vitamin/favorite_vitamin_bloc.dart';
import 'package:nutri_kit/features/food/presentation/bloc/food_detail_bloc.dart';
import 'package:nutri_kit/features/food/presentation/bloc/vitamin_detail/vitamin_detail_bloc.dart';
import 'package:nutri_kit/features/forgot_password/data/blocs/bloc/forgot_password_bloc.dart';
import 'package:nutri_kit/features/forgot_password/data/repository/forgot_password_repository_impl.dart';
import 'package:nutri_kit/features/home/presentation/bloc/trivia_bloc/trivia_bloc.dart';
import 'package:nutri_kit/features/meal/presentation/blocs/child_health_list/child_health_list_bloc.dart';
import 'package:nutri_kit/features/meal/presentation/blocs/create_child_health_form/create_child_health_form_bloc.dart';
import 'package:nutri_kit/features/meal/presentation/blocs/meal_plan_detail/meal_plan_detail_bloc.dart';
import 'package:nutri_kit/features/profile/presentation/bloc/update_profile_bloc.dart';
import 'package:nutri_kit/features/remedy/presentation/bloc/remedy_detail_bloc.dart';
import 'package:nutri_kit/features/search/presentation/blocs/search/search_bloc.dart';
import 'package:nutri_kit/features/search/presentation/blocs/search_deficiency/search_deficiency_bloc.dart';
import 'package:nutri_kit/features/search/presentation/blocs/search_food/search_food_bloc.dart';
import 'package:nutri_kit/features/search/presentation/blocs/search_remedy/search_remedy_bloc.dart';
import 'package:nutri_kit/features/search/presentation/blocs/search_vitamin/search_vitamin_bloc.dart';

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
        create: (context) => serviceLocator<VitaminDetailBloc>(),
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
      BlocProvider(
        create: (context) => serviceLocator<MealPlanDetailBloc>(),
      ),
      BlocProvider(
        create: (context) => serviceLocator<MealPlanDetailBloc>(),
      ),
      BlocProvider(
        create: (context) => serviceLocator<FavoriteDeficiencyBloc>(),
      ),
      BlocProvider(
        create: (context) => serviceLocator<FavoriteRemedyBloc>(),
      ),
      BlocProvider(
        create: (context) => serviceLocator<FavoriteFoodBloc>(),
      ),
      BlocProvider(
        create: (context) => serviceLocator<FavoriteVitaminBloc>(),
      ),
      BlocProvider(
        create: (context) => serviceLocator<SearchDeficiencyBloc>(),
      ),
      BlocProvider(
        create: (context) => serviceLocator<SearchFoodBloc>(),
      ),
      BlocProvider(
        create: (context) => serviceLocator<SearchRemedyBloc>(),
      ),
      BlocProvider(
        create: (context) => serviceLocator<SearchVitaminBloc>(),
      ),
      BlocProvider(
        create: (context) => ForgotPasswordBloc(
          forgotPasswordRepository: ForgotPasswordRepositoryImpl(),
        ),
      ),
      BlocProvider(
        create: (context) => ChangePasswordBloc(
          changePasswordRepository: ChangePasswordRepositoryImpl(),
        ),
      ),
    ];
  }
}
