import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:nutri_kit/core/common/cubits/cubit/app_user_cubit.dart';
import 'package:nutri_kit/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:nutri_kit/features/home/presentation/bloc/trivia_bloc/trivia_bloc.dart';
import 'package:nutri_kit/features/home/presentation/bloc/trivia_slider/trivia_selected_slider_cubit.dart';
import 'package:nutri_kit/features/home/presentation/pages/body/pinggang_pinoy.dart';
import 'package:nutri_kit/features/home/presentation/widgets/trivia_slider.dart';
import 'package:nutri_kit/features/home/presentation/widgets/user_information.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: BlocConsumer<AppUserCubit, AppUserState>(
            listener: (context, state) {
              if (state is AppUserLoggedIn) {
                context.read<TriviaBloc>().add(TriviaGetList());
              }
            },
            builder: (context, state) {
              if (state is GettingAppUser) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              }

              if (state is AppUserLoggedIn) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      UserInformation(
                        firstName: state.user.firstName,
                      ),
                      const Gap(10),
                      BlocProvider(
                        create: (context) => TriviaSelectedSliderCubit(),
                        child: const TriviaSlider(),
                      ),
                      const Gap(15),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PinggangPinoy(),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }

              if (state is AppUserFail) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Failed to retrieve data',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                        ),
                      ),
                      const Gap(10),
                      SizedBox(
                        height: 40,
                        width: 135,
                        child: ElevatedButton(
                          child: const Text(
                            'Refresh',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            context.read<AuthBloc>().add(AuthRefreshUser());
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
