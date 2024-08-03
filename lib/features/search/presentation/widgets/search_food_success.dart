import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import 'package:nutri_kit/features/search/domain/entities/index.dart';
import 'package:nutri_kit/gen/assets.gen.dart';
import 'package:nutri_kit/gen/colors.gen.dart';
import 'package:nutri_kit/router/index.dart';

class SearchFoodSuccess extends StatelessWidget {
  const SearchFoodSuccess({
    super.key,
    this.data,
  });

  final FoodResponseEntity? data;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    if (data == null) return const SizedBox();
    if (data!.results.isEmpty) return const SizedBox();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Food',
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            if (data!.results.length > 3)
              TextButton(
                onPressed: () {},
                child: Text(
                  'View All',
                  style: textTheme.titleMedium?.copyWith(color: ColorName.link),
                ),
              ),
          ],
        ),
        const Gap(10),
        ...data!.results.take(2).map(
              (e) => GestureDetector(
                onTap: () {
                  context.pushNamed(
                    AppRoutes.foodDetail.name,
                    pathParameters: {"id": e.id.toString()},
                  );
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(22),
                  height: 130,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      foodImageBuild(e.image),
                      const Gap(15),
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  e.name,
                                  style: textTheme.titleMedium?.copyWith(
                                    color: ColorName.link,
                                  ),
                                ),
                                Text(
                                  e.description,
                                  style: textTheme.titleSmall?.copyWith(
                                    color: Colors.grey.shade500,
                                  ),
                                  textAlign: TextAlign.justify,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            Flexible(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: e.vitamins
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
                                              style: textTheme.labelSmall
                                                  ?.copyWith(
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
                      )
                    ],
                  ),
                ),
              ),
            ),
      ],
    );
  }

  Widget foodImageBuild(String? url) {
    if (url == null) return Assets.images.placeholder.deficiency.image();

    return Image.network(url);
  }
}
