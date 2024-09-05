// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:nutri_kit/features/meal/domain/entities/index.dart';
import 'package:nutri_kit/gen/colors.gen.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HealthProgress extends StatelessWidget {
  const HealthProgress({
    super.key,
    required this.data,
  });

  final UserMealPlanDetailEntity data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: ColorName.secondary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'My Health Progress',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Gap(20),
          CircularPercentIndicator(
            radius: 80.0,
            lineWidth: 15.0,
            animation: true,
            percent: getPercentCalories(),
            center: Text(
              "${getPercentCalories()}%",
              style: const TextStyle(fontSize: 18.0),
            ),
            footer: footerText(
              fontSize: 18,
              title: 'Calories',
              currentValue: data.currentCalories,
              totalValue: data.totalCalories,
            ),
            circularStrokeCap: CircularStrokeCap.square,
            progressColor: Colors.white,
          ),
          const Gap(20),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircularPercentIndicator(
                radius: 45.0,
                lineWidth: 6,
                animation: true,
                percent: getPercentCarbs(),
                center: Text(
                  "${getPercentCarbs()}%",
                  style: const TextStyle(fontSize: 15.0),
                ),
                footer: footerText(
                  title: "Carbohydrates",
                  currentValue: data.currentCarbs,
                  totalValue: data.totalCarbs,
                ),
                circularStrokeCap: CircularStrokeCap.square,
                progressColor: const Color(0xFFF9F8A7),
              ),
              CircularPercentIndicator(
                radius: 45.0,
                lineWidth: 6,
                animation: true,
                percent: getPercentProtein(),
                center: Text(
                  "${getPercentProtein()}%",
                  style: const TextStyle(fontSize: 15.0),
                ),
                footer: footerText(
                  title: "Protein",
                  currentValue: data.currentProtein,
                  totalValue: data.totalProtein,
                ),
                circularStrokeCap: CircularStrokeCap.square,
                progressColor: const Color(0xFFD7DF5B),
              ),
              CircularPercentIndicator(
                radius: 45.0,
                lineWidth: 6,
                animation: true,
                percent: getPercentFat(),
                center: Text(
                  "${getPercentFat()}%",
                  style: const TextStyle(fontSize: 15.0),
                ),
                footer: footerText(
                  title: "Fat",
                  currentValue: data.currentFats,
                  totalValue: data.totalFats,
                ),
                circularStrokeCap: CircularStrokeCap.square,
                progressColor: const Color(0xFFD4AE64),
              ),
            ],
          )
        ],
      ),
    );
  }

  double getPercentCalories() {
    if (data.currentCalories == 0) {
      return 0;
    }

    return double.parse(
        (data.currentCalories / data.totalCalories).toStringAsFixed(2));
  }

  double getPercentCarbs() {
    if (data.currentCarbs == 0) {
      return 0;
    }

    return double.parse(
        (data.currentCarbs / data.totalCarbs).toStringAsFixed(2));
  }

  double getPercentProtein() {
    if (data.currentProtein == 0) {
      return 0;
    }

    return double.parse(
        (data.currentProtein / data.totalProtein).toStringAsFixed(2));
  }

  double getPercentFat() {
    if (data.currentFats == 0) {
      return 0;
    }

    return double.parse((data.currentFats / data.totalFats).toStringAsFixed(2));
  }

  Widget footerText({
    required String title,
    required double currentValue,
    required double totalValue,
    double? fontSize,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: fontSize ?? 12,
              color: const Color(0xFFE4E0E0),
              fontStyle: FontStyle.italic,
            ),
          ),
          Text(
            '${currentValue}gr/${totalValue}gr',
            style: TextStyle(
              fontSize: fontSize ?? 12,
              color: const Color(0xFFFCFAEF),
            ),
          )
        ],
      ),
    );
  }
}
