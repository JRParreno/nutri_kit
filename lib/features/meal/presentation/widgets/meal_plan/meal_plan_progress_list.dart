// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:nutri_kit/features/meal/domain/entities/index.dart';
import 'package:nutri_kit/gen/colors.gen.dart';
import 'package:nutri_kit/router/index.dart';

class MealPlanProgressList extends StatelessWidget {
  const MealPlanProgressList({
    super.key,
    required this.dayMealsCompletions,
  });

  final List<DayMealCompletionEntity> dayMealsCompletions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widgetDayCompletions(context),
    );
  }

  List<Widget> widgetDayCompletions(BuildContext context) {
    return dayMealsCompletions
        .map(
          (e) => Column(
            children: [
              GestureDetector(
                onTap: () {
                  context.pushNamed(
                    AppRoutes.mealBreakdownPage.name,
                    extra: e,
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Day ${e.dayMealPlan.dayNumber.toString()}',
                        style: textStyle(),
                      ),
                      Chip(
                        padding: EdgeInsets.zero,
                        backgroundColor: e.completed ? Colors.blue : Colors.red,
                        label: Text(
                          '${e.completed ? '' : 'Not'} Completed',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10)
            ],
          ),
        )
        .toList();
  }

  TextStyle textStyle([Color textColor = ColorName.secondary]) {
    return TextStyle(
      color: textColor,
      fontSize: 18,
    );
  }
}
