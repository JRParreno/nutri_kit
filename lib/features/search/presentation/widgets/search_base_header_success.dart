import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:nutri_kit/gen/colors.gen.dart';

class SearchBaseHeaderSuccess extends StatelessWidget {
  const SearchBaseHeaderSuccess({
    super.key,
    required this.displayTitle,
    required this.onTViewAll,
    required this.isShowViewAll,
    required this.children,
  });

  final String displayTitle;
  final VoidCallback onTViewAll;
  final bool isShowViewAll;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Remedy',
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            if (isShowViewAll)
              TextButton(
                onPressed: onTViewAll,
                child: Text(
                  'View All',
                  style: textTheme.titleMedium?.copyWith(color: ColorName.link),
                ),
              ),
          ],
        ),
        const Gap(10),
        ...children,
      ],
    );
  }
}
