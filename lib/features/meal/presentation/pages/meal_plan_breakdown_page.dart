// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:nutri_kit/core/common/widgets/loader.dart';

import 'package:nutri_kit/features/meal/domain/entities/index.dart';
import 'package:nutri_kit/features/meal/presentation/blocs/meal_plan_detail/meal_plan_detail_bloc.dart';
import 'package:nutri_kit/features/meal/presentation/widgets/meal_plan/index.dart';
import 'package:quickalert/quickalert.dart';

class MealPlanBreakdownPage extends StatefulWidget {
  const MealPlanBreakdownPage({
    super.key,
    required this.dayMealCompletionEntity,
  });

  final DayMealCompletionEntity dayMealCompletionEntity;

  @override
  State<MealPlanBreakdownPage> createState() => _MealPlanBreakdownPageState();
}

class _MealPlanBreakdownPageState extends State<MealPlanBreakdownPage> {
  late DayMealCompletionEntity data;
  List<MealEntity> meals = [];
  bool isCompletedManually = false;

  @override
  void initState() {
    super.initState();
    initSetup();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Day ${data.dayMealPlan.dayNumber.toString()}',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: BlocConsumer<MealPlanDetailBloc, MealPlanDetailState>(
        listener: blocListener,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...mealWigets(),
                  if (!data.completed && isDateToday() && !isCompletedManually)
                    ElevatedButton(
                      onPressed: () {
                        context.read<MealPlanDetailBloc>().add(
                              UpdateMealPlanCompleted(
                                id: data.id,
                                isCompleted: true,
                              ),
                            );
                      },
                      child: const Text(
                        'Complete',
                        style: TextStyle(
                          fontFamily: 'Signika',
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  List<Widget> mealWigets() {
    return meals
        .map(
          (e) => Column(
            children: [
              MealDetails(
                mealEntity: e,
              ),
              const Gap(15),
            ],
          ),
        )
        .toList();
  }

  bool isDateToday() {
    return DateUtils.isSameDay(data.date, DateTime.now()) ||
        data.date.isBefore(DateTime.now());
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

  void onPageSuccess(String message) {
    Future.delayed(const Duration(milliseconds: 600), () {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        title: 'Congrats',
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

    if (state is MealPlanDetailSuccess) {
      onPageSuccess("Successfully completed!");
      setState(() {
        isCompletedManually = true;
      });
    }

    if (state is MealPlanDetailFailure) {
      onPageError(state.message);
    }
  }

  void initSetup() {
    data = widget.dayMealCompletionEntity;

    if (data.dayMealPlan.breakfast != null) {
      meals.add(data.dayMealPlan.breakfast!);
    }
    if (data.dayMealPlan.midMorningSnack != null) {
      meals.add(data.dayMealPlan.midMorningSnack!);
    }
    if (data.dayMealPlan.lunch != null) {
      meals.add(data.dayMealPlan.lunch!);
    }
    if (data.dayMealPlan.afternoonSnack != null) {
      meals.add(data.dayMealPlan.afternoonSnack!);
    }

    if (data.dayMealPlan.dinner != null) {
      meals.add(data.dayMealPlan.dinner!);
    }
    if (data.dayMealPlan.eveningSnack != null) {
      meals.add(data.dayMealPlan.eveningSnack!);
    }
    setState(() {});
    isCompletedManually = data.completed;
  }
}
