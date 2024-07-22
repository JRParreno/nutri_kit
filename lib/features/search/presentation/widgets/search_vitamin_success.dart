import 'package:flutter/material.dart';

import 'package:nutri_kit/features/search/domain/entities/index.dart';
import 'package:nutri_kit/features/search/presentation/widgets/index.dart';
import 'package:nutri_kit/gen/assets.gen.dart';

class SearchVitaminSuccess extends StatelessWidget {
  const SearchVitaminSuccess({
    super.key,
    this.data,
  });

  final VitaminResponseEntity? data;

  @override
  Widget build(BuildContext context) {
    if (data == null) return const SizedBox();
    if (data!.results.isEmpty) return const SizedBox();

    return SearchBaseHeaderSuccess(
      displayTitle: 'Vitamin',
      isShowViewAll: data!.results.length > 2,
      onTViewAll: () {},
      children: data!.results
          .take(2)
          .map(
            (e) => SearchTileItem(
              defaultImage: Assets.images.placeholder.vitamins.image(),
              title: e.name,
              description: e.description,
            ),
          )
          .toList(),
    );
  }
}
