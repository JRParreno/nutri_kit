import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:nutri_kit/gen/assets.gen.dart';
import 'package:nutri_kit/gen/colors.gen.dart';
import 'package:nutri_kit/router/index.dart';

class EmptyChildList extends StatelessWidget {
  const EmptyChildList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 225,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                30,
              ),
            ),
            child: const Column(
              children: [
                Text(
                  "Monitor Your",
                  style: TextStyle(
                    color: ColorName.detailBg,
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                ),
                Text(
                  "Child Health.",
                  style: TextStyle(
                    color: ColorName.detailBg,
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                ),
              ],
            ),
          ),
          const Gap(20),
          Assets.images.meal.childListImg.image(),
          const Gap(20),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 60,
            ),
            child: ElevatedButton(
              onPressed: () {
                context.pushNamed(AppRoutes.createChildHealthForm.name);
              },
              child: const Text(
                'Continue',
                style: TextStyle(
                  fontFamily: 'Signika',
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
