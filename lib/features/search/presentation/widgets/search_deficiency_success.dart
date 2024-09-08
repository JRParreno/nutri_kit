// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:nutri_kit/features/search/domain/entities/index.dart';
import 'package:nutri_kit/features/search/presentation/widgets/search_base_header_success.dart';
import 'package:nutri_kit/features/search/presentation/widgets/search_tile_item.dart';
import 'package:nutri_kit/gen/assets.gen.dart';
import 'package:nutri_kit/router/index.dart';

class SearchDeficiencySuccess extends StatelessWidget {
  const SearchDeficiencySuccess({
    super.key,
    this.data,
    required this.keyword,
  });

  final DeficiencySearchResponseEntity? data;
  final String keyword;

  @override
  Widget build(BuildContext context) {
    if (data == null) return const SizedBox();
    if (data!.results.isEmpty) return const SizedBox();

    return SearchBaseHeaderSuccess(
      displayTitle: 'Deficiency',
      isShowViewAll: data!.results.length > 2,
      onTViewAll: () {
        context.pushNamed(
          AppRoutes.searchDeficiency.name,
          pathParameters: {"keyword": keyword},
        );
      },
      children: data!.results
          .take(2)
          .map(
            (e) => SearchTileItem(
              onTap: () {
                context.pushNamed(
                  AppRoutes.deficiencyDetail.name,
                  pathParameters: {"id": e.id.toString()},
                );
              },
              defaultImage: Assets.images.placeholder.deficiency.image(),
              title: e.name,
              description: e.description,
            ),
          )
          .toList(),
    );
  }
}
