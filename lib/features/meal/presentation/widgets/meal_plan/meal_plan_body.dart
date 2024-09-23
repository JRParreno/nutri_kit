// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nutri_kit/features/meal/presentation/blocs/meal_plan_detail/meal_plan_detail_bloc.dart';

import 'package:nutri_kit/features/meal/presentation/widgets/meal_plan/index.dart';
import 'package:nutri_kit/gen/colors.gen.dart';

class MealPlanBody extends StatelessWidget {
  const MealPlanBody({
    super.key,
    required this.data,
  });

  final MealPlanDetailSuccess data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ChildDetail(
              name: data.userMealPlanDetailEntity.name,
            ),
            const Gap(20),
            HealthProgress(
              data: data.userMealPlanDetailEntity,
            ),
            const Gap(30),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: ColorName.titleBg,
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  child: const Text(
                    'Meal Plan Checker',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF53C1AD),
                    ),
                  ),
                ),
                const Gap(10),
                MealPlanProgressList(
                  dayMealsCompletions:
                      data.userMealPlanDetailEntity.dayMealCompletion,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
