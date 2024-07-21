import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nutri_kit/gen/colors.gen.dart';

class SearchTileItem extends StatelessWidget {
  const SearchTileItem({
    super.key,
    required this.defaultImage,
    required this.title,
    required this.description,
    this.imageUrl,
  });

  final Widget defaultImage;
  final String title;
  final String description;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
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
          remedyImageBuild(imageUrl),
          const Gap(15),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: textTheme.titleMedium?.copyWith(
                    color: ColorName.link,
                  ),
                ),
                Text(
                  description,
                  style: textTheme.titleSmall?.copyWith(
                    color: Colors.grey.shade500,
                  ),
                  textAlign: TextAlign.justify,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget remedyImageBuild(String? url) {
    if (url == null) {
      return defaultImage;
    }

    return Image.network(
      url,
      height: 75,
    );
  }
}
