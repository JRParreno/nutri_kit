import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_kit/core/common/cubits/cubit/app_user_cubit.dart';
import 'package:nutri_kit/gen/colors.gen.dart';

class UserInformation extends StatelessWidget {
  const UserInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppUserCubit, AppUserState>(
      builder: (context, state) {
        if (state is AppUserLoggedIn) {
          final textTheme = Theme.of(context).textTheme;

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hello ${state.user.firstName}',
                style: textTheme.headlineSmall?.copyWith(fontSize: 25),
              ),
              Text(
                'Find, track and eat healthy food',
                style: textTheme.bodyLarge?.copyWith(
                  fontSize: 18,
                  color: ColorName.link,
                ),
              ),
            ],
          );
        }

        return const SizedBox();
      },
    );
  }
}
