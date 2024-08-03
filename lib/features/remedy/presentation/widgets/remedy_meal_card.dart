// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:nutri_kit/features/food/domain/entities/index.dart';
import 'package:nutri_kit/gen/assets.gen.dart';
import 'package:nutri_kit/gen/colors.gen.dart';

class RemedyMealCard extends StatelessWidget {
  const RemedyMealCard({
    super.key,
    required this.foodEntity,
    this.onTap,
  });

  final FoodEntity foodEntity;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 110,
        decoration: BoxDecoration(
          color: ColorName.detailBg,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Container(
              height: 110,
              width: 110,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: ColorName.miniCardBg,
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: imageBuild(foodEntity.image)),
            ),
            const Gap(5),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          foodEntity.name,
                          style: textTheme.titleMedium?.copyWith(
                            color: ColorName.miniCardBg,
                          ),
                        ),
                        Text(
                          foodEntity.description,
                          style: textTheme.titleSmall?.copyWith(
                            color: ColorName.miniCardBg,
                          ),
                          textAlign: TextAlign.justify,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: foodEntity.vitamins
                            .take(3)
                            .map(
                              (e) => Container(
                                width: 60,
                                height: 30,
                                margin: const EdgeInsets.only(right: 5),
                                child: Center(
                                  child: Chip(
                                    padding: const EdgeInsets.all(1),
                                    label: Text(
                                      e.name,
                                      style: textTheme.labelSmall?.copyWith(
                                        color: Colors.grey.shade500,
                                      ),
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget imageBuild(String? imageUrl) {
    if (imageUrl == null) {
      return Assets.images.placeholder.food.image();
    }

    return Image.network(imageUrl);
  }
}
