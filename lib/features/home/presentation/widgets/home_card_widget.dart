// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:nutri_kit/gen/colors.gen.dart';

class HomeCardWidget extends StatelessWidget {
  const HomeCardWidget({
    super.key,
    required this.image,
    required this.onTap,
    this.title,
  });

  final Image image;
  final VoidCallback onTap;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final size = (MediaQuery.of(context).size.width - 96) / 2;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: ColorName.card,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Flexible(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: image,
              ),
            ),
            if (title != null) ...[
              Text(
                title!,
                style: const TextStyle(color: ColorName.detailBg),
              )
            ],
          ],
        ),
      ),
    );
  }
}
