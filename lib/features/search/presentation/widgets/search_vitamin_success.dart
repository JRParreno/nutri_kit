import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:nutri_kit/features/search/domain/entities/index.dart';
import 'package:nutri_kit/features/search/presentation/widgets/index.dart';
import 'package:nutri_kit/gen/assets.gen.dart';
import 'package:nutri_kit/router/index.dart';

class SearchVitaminSuccess extends StatelessWidget {
  const SearchVitaminSuccess({
    super.key,
    this.data,
    required this.keyword,
  });

  final VitaminResponseEntity? data;
  final String keyword;
  @override
  Widget build(BuildContext context) {
    if (data == null) return const SizedBox();
    if (data!.results.isEmpty) return const SizedBox();

    return SearchBaseHeaderSuccess(
      displayTitle: 'Vitamin',
      isShowViewAll: data!.results.length > 2,
      onTViewAll: () {
        context.pushNamed(
          AppRoutes.searchVitamin.name,
          pathParameters: {"keyword": keyword},
        );
      },
      children: data!.results
          .take(2)
          .map(
            (e) => SearchTileItem(
              defaultImage: Assets.images.placeholder.vitamins.image(),
              title: e.name,
              description: e.description,
              onTap: () {
                context.pushNamed(
                  AppRoutes.vitaminDetail.name,
                  pathParameters: {"id": e.id.toString()},
                );
              },
            ),
          )
          .toList(),
    );
  }
}
