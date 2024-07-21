import 'package:flutter/material.dart';

import 'package:nutri_kit/features/search/domain/entities/index.dart';
import 'package:nutri_kit/features/search/presentation/widgets/search_base_header_success.dart';
import 'package:nutri_kit/features/search/presentation/widgets/search_tile_item.dart';
import 'package:nutri_kit/gen/assets.gen.dart';

class SearchDeficiencySuccess extends StatelessWidget {
  const SearchDeficiencySuccess({
    super.key,
    this.data,
  });

  final DeficiencyResponseEntity? data;

  @override
  Widget build(BuildContext context) {
    if (data == null) return const SizedBox();
    if (data!.results.isEmpty) return const SizedBox();

    return SearchBaseHeaderSuccess(
      displayTitle: 'Deficiency',
      isShowViewAll: data!.results.length > 2,
      onTViewAll: () {},
      children: data!.results
          .take(2)
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
