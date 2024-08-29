// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:nutri_kit/features/meal/domain/entities/index.dart';
import 'package:nutri_kit/features/meal/presentation/widgets/meal_plan/index.dart';

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
  late List<MealEntity> meals;

  @override
  void initState() {
    super.initState();
    data = widget.dayMealCompletionEntity;
    meals = [
      data.dayMealPlan.breakfast,
      data.dayMealPlan.midMorningSnack,
      data.dayMealPlan.lunch,
      data.dayMealPlan.afternoonSnack,
      data.dayMealPlan.dinner,
      data.dayMealPlan.eveningSnack,
    ];
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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...mealWigets(),
              if (!data.completed && isDateToday())
                ElevatedButton(
                  onPressed: () {},
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
    return DateUtils.isSameDay(data.date, DateTime.now());
  }
}
