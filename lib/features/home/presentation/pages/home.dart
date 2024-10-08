import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:nutri_kit/core/common/cubits/cubit/app_user_cubit.dart';
import 'package:nutri_kit/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:nutri_kit/features/home/presentation/bloc/trivia_bloc/trivia_bloc.dart';
import 'package:nutri_kit/features/home/presentation/bloc/trivia_slider/trivia_selected_slider_cubit.dart';
import 'package:nutri_kit/features/home/presentation/pages/body/deficiency_home.dart';
import 'package:nutri_kit/features/home/presentation/pages/body/pinggang_pinoy.dart';
import 'package:nutri_kit/features/home/presentation/widgets/trivia_slider.dart';
import 'package:nutri_kit/features/home/presentation/widgets/user_information.dart';
import 'package:nutri_kit/gen/colors.gen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDeficiency = true;

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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              spacing: 32,
                              runSpacing: 32,
                              children: [
                                GestureDetector(
                                  child: titleHome(
                                    title: 'Deficiencies',
                                    isSelected: isDeficiency,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      isDeficiency = true;
                                    });
                                  },
                                ),
                                GestureDetector(
                                  child: titleHome(
                                      title: 'Pinggang Pinoy',
                                      isSelected: !isDeficiency),
                                  onTap: () {
                                    setState(() {
                                      isDeficiency = false;
                                    });
                                  },
                                ),
                              ],
                            ),
                            const Gap(10),
                            if (isDeficiency) const DeficiencyHome(),
                            if (!isDeficiency) const PinggangPinoy(),
                            const Gap(25)
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

  Widget titleHome({required String title, required bool isSelected}) {
    final size = (MediaQuery.of(context).size.width - 96) / 2;

    return Container(
      width: size,
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: isSelected ? ColorName.secondary : ColorName.card,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: !isSelected ? ColorName.secondary : ColorName.card,
            fontSize: 16,
            letterSpacing: 0.24,
          ),
        ),
      ),
    );
  }
}
