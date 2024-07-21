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
      isShowViewAll: data!.results.length > 3,
      onTViewAll: () {},
      children: data!.results
          .map(
            (e) => SearchTileItem(
              defaultImage: Assets.images.placeholder.deficiency.image(),
              title: e.name,
              description: e.description,
            ),
          )
          .toList(),
    );
  }
}
