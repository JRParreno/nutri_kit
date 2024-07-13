import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:nutri_kit/features/home/presentation/bloc/trivia_bloc/trivia_bloc.dart';
import 'package:nutri_kit/features/home/presentation/bloc/trivia_slider/trivia_selected_slider_cubit.dart';
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
    context.read<TriviaBloc>().add(TriviaGetList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const UserInformation(),
                const Gap(10),
                BlocProvider(
                  create: (context) => TriviaSelectedSliderCubit(),
                  child: const TriviaSlider(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
