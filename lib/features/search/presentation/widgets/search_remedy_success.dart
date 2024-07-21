import 'package:flutter/material.dart';

import 'package:nutri_kit/features/search/domain/entities/index.dart';
import 'package:nutri_kit/features/search/presentation/widgets/index.dart';
import 'package:nutri_kit/gen/assets.gen.dart';

class SearchRemedySuccess extends StatelessWidget {
  const SearchRemedySuccess({
    super.key,
    this.data,
  });

  final RemediesResponseEntity? data;

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
              defaultImage: Assets.images.placeholder.remedy.image(),
              title: e.name,
              description: e.description,
            ),
          )
          .toList(),
    );
  }
}
