// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_kit/core/common/widgets/loader.dart';
import 'package:nutri_kit/features/meal/presentation/blocs/meal_plan_detail/meal_plan_detail_bloc.dart';
import 'package:nutri_kit/features/meal/presentation/widgets/meal_plan/index.dart';
import 'package:nutri_kit/gen/colors.gen.dart';
import 'package:quickalert/quickalert.dart';

class ChildMealPlanDetailPage extends StatefulWidget {
  const ChildMealPlanDetailPage({
    super.key,
    required this.userMealPlanId,
    required this.mealPlanId,
  });

  final String userMealPlanId;
  final String mealPlanId;

  @override
  State<ChildMealPlanDetailPage> createState() =>
      _ChildMealPlanDetaiPageState();
}

class _ChildMealPlanDetaiPageState extends State<ChildMealPlanDetailPage> {
  @override
  void initState() {
    super.initState();
    context.read<MealPlanDetailBloc>().add(
          GetMealPlanDetailEvent(
            mealPlanId: widget.mealPlanId,
            userMealPlanId: widget.userMealPlanId,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.primary,
      appBar: AppBar(
        title: const Text(
          'Meal Plan',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: BlocConsumer<MealPlanDetailBloc, MealPlanDetailState>(
        listener: blocListener,
        builder: (context, state) {
          if (state is MealPlanDetailFailure) {
            return const Center(
              child: Text(
                'Something went wrong in our server, please try again later.',
              ),
            );
          }

          if (state is MealPlanDetailSuccess) {
            return MealPlanBody(
              data: state,
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  void onPageError(String message) {
    Future.delayed(const Duration(milliseconds: 600), () {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: 'Oops...',
        text: message,
      );
    });
  }

  void blocListener(BuildContext context, MealPlanDetailState state) {
    if (state is MealPlanDetailLoading) {
      LoadingScreen.instance().show(context: context);
    }

    if (state is MealPlanDetailSuccess || state is MealPlanDetailFailure) {
      Future.delayed(const Duration(milliseconds: 500), () {
        LoadingScreen.instance().hide();
      });
    }

    if (state is MealPlanDetailFailure) {
      onPageError(state.message);
    }
  }
}
