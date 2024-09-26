import 'package:flutter/material.dart';
import 'package:nutri_kit/features/meal/domain/entities/index.dart';
import 'package:nutri_kit/gen/colors.gen.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({
    super.key,
    required this.mealEntity,
  });

  final MealEntity mealEntity;

  @override
  Widget build(BuildContext context) {
    const chipColor = Color(0xFFF3EBE5);
    const fontColor = Color(0xFF66C0AB);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFF3EBE5),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            mealEntity.name,
            style: titleStyle(),
          ),
          const Divider(
            color: ColorName.primary,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFF66C0AB),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mealEntity.description,
                  style: titleStyle()
                      .copyWith(fontSize: 14, color: const Color(0xFFF3EBE5)),
                ),
                Wrap(
                  spacing: 8,
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  runAlignment: WrapAlignment.start,
                  children: [
                    Chip(
                      padding: EdgeInsets.zero,
                      backgroundColor: chipColor,
                      label: Text(
                        'Carbs ${mealEntity.carbs}',
                        style: const TextStyle(
                          color: fontColor,
                          fontSize: 10,
                        ),
                      ),
                    ),
                    Chip(
                      padding: EdgeInsets.zero,
                      backgroundColor: chipColor,
                      label: Text(
                        'Calories ${mealEntity.calories}',
                        style: const TextStyle(
                          color: fontColor,
                          fontSize: 10,
                        ),
                      ),
                    ),
                    Chip(
                      padding: EdgeInsets.zero,
                      backgroundColor: chipColor,
                      label: Text(
                        'Fats ${mealEntity.fats}',
                        style: const TextStyle(
                          color: fontColor,
                          fontSize: 10,
                        ),
                      ),
                    ),
                    Chip(
                      padding: EdgeInsets.zero,
                      backgroundColor: chipColor,
                      label: Text(
                        'Protein ${mealEntity.protein}',
                        style: const TextStyle(
                          color: fontColor,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  TextStyle titleStyle() {
    return const TextStyle(
      color: ColorName.secondary,
      fontSize: 16,
    );
  }
}
