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
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
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
          Wrap(
            spacing: 8,
            alignment: WrapAlignment.spaceBetween,
            children: [
              Chip(
                padding: EdgeInsets.zero,
                backgroundColor: Colors.brown,
                label: Text(
                  'Carbs ${mealEntity.carbs}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
              Chip(
                padding: EdgeInsets.zero,
                backgroundColor: Colors.lightGreen,
                label: Text(
                  'Calories ${mealEntity.calories}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
              Chip(
                padding: EdgeInsets.zero,
                backgroundColor: Colors.blue,
                label: Text(
                  'Fats ${mealEntity.fats}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
              Chip(
                padding: EdgeInsets.zero,
                backgroundColor: const Color(0xFF7F00FF),
                label: Text(
                  'Protein ${mealEntity.protein}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          Text(
            mealEntity.description,
            style: titleStyle(),
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
