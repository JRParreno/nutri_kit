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
        const TitleTextWidget(
          title: 'Deficiency',
        ),
        const Gap(10),
        Wrap(
          alignment: WrapAlignment.spaceBetween,
          spacing: 32,
          runSpacing: 32,
          children: [
            HomeCardWidget(
              image: Assets.images.meal.underweight.image(),
              onTap: () => handleOnTap(
                title: 'Underweight',
                context: context,
                heathStatus: HealthStatusEnum.underweight,
              ),
            ),
            HomeCardWidget(
              image: Assets.images.meal.waisted.image(),
              onTap: () => handleOnTap(
                title: 'Waisted',
                context: context,
                heathStatus: HealthStatusEnum.waisted,
              ),
            ),
            HomeCardWidget(
              image: Assets.images.meal.stunted.image(),
              onTap: () => handleOnTap(
                title: 'Stunted',
                context: context,
                heathStatus: HealthStatusEnum.stunted,
              ),
            ),
            HomeCardWidget(
              image: Assets.images.meal.obese.image(),
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
