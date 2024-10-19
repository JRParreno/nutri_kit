import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:nutri_kit/core/enum/health_status_enum.dart';
import 'package:nutri_kit/features/home/presentation/widgets/index.dart';
import 'package:nutri_kit/gen/assets.gen.dart';
import 'package:nutri_kit/router/index.dart';

class DeficiencyHome extends StatelessWidget {
  const DeficiencyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(10),
        Wrap(
          alignment: WrapAlignment.spaceBetween,
          spacing: 32,
          runSpacing: 32,
          children: [
            HomeCardWidget(
              title: 'Underweight',
              image: Assets.images.meal.underweight.image(fit: BoxFit.cover),
              onTap: () => handleOnTap(
                title: 'Underweight',
                context: context,
                heathStatus: HealthStatusEnum.underweight,
              ),
            ),
            HomeCardWidget(
              title: 'Wasted',
              image: Assets.images.meal.waisted.image(fit: BoxFit.cover),
              onTap: () => handleOnTap(
                title: 'Wasted',
                context: context,
                heathStatus: HealthStatusEnum.waisted,
              ),
            ),
            HomeCardWidget(
              title: 'Stunted',
              image: Assets.images.meal.stunted.image(fit: BoxFit.cover),
              onTap: () => handleOnTap(
                title: 'Stunted',
                context: context,
                heathStatus: HealthStatusEnum.stunted,
              ),
            ),
            HomeCardWidget(
              title: 'Overweight',
              image: Assets.images.meal.overweight.image(fit: BoxFit.cover),
              onTap: () => handleOnTap(
                title: 'Overweight',
                context: context,
                heathStatus: HealthStatusEnum.overweight,
              ),
            ),
            HomeCardWidget(
              title: 'Obese',
              image: Assets.images.meal.obese.image(fit: BoxFit.cover),
              onTap: () => handleOnTap(
                title: 'Older Persons',
                context: context,
                heathStatus: HealthStatusEnum.obese,
              ),
            ),
          ],
        )
      ],
    );
  }

  void handleOnTap({
    required String title,
    required BuildContext context,
    required HealthStatusEnum heathStatus,
  }) {
    context.pushNamed(AppRoutes.deficiencyViewPage.name, pathParameters: {
      "health_status": heathStatus.name,
    });
  }
}
