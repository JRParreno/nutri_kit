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
                  height: 62,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: e.completed ? const Color(0xFF66C0AB) : Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: e.completed
                      ? Stack(
                          alignment: Alignment.center,
                          children: [
                            const Text(
                              'Completed',
                              style: TextStyle(
                                fontSize: 25,
                                color: Color(0xffffffff),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              child: Text(
                                'Day ${e.dayMealPlan.dayNumber.toString()}',
                                style: textStyle()
                                    .copyWith(color: const Color(0xFFFFFFFF)),
                              ),
                            )
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Day ${e.dayMealPlan.dayNumber.toString()}',
                              style: textStyle(),
                            ),
                            Container(
                              padding: const EdgeInsets.all(13),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: const Color(0xFF66C0AB),
                              ),
                              child: Text(
                                '${e.completed ? '' : 'Not'} Completed',
                                style: const TextStyle(
                                  color: Color(0xFFF1E2D4),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
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
