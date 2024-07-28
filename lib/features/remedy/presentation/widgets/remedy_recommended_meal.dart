// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:nutri_kit/features/food/domain/entities/index.dart';
import 'package:nutri_kit/features/remedy/presentation/widgets/remedy_meal_card.dart';
import 'package:nutri_kit/gen/colors.gen.dart';

class RemedyRecommendedMeal extends StatelessWidget {
  const RemedyRecommendedMeal({
    super.key,
    required this.foods,
  });

  final List<FoodEntity> foods;

  @override
  Widget build(BuildContext context) {
    if (foods.isEmpty) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: ColorName.miniCardBg,
          ),
          child: const Text(
            "Recommended Meal",
            style: TextStyle(
              color: ColorName.secondary,
              fontSize: 25,
            ),
          ),
        ),
        const Gap(25),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => RemedyMealCard(
              foodEntity: foods[index],
            ),
            separatorBuilder: (context, index) => const Gap(15),
            itemCount: foods.length,
          ),
        )
      ],
    );
  }
}
