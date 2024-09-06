import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nutri_kit/gen/assets.gen.dart';
import 'package:nutri_kit/gen/colors.gen.dart';

class VitaminInfo extends StatelessWidget {
  const VitaminInfo({
    super.key,
    required this.title,
    required this.description,
    this.imageUrl,
  });

  final String title;
  final String description;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 35;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: width - 35,
          width: width,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: imageBuilder(imageUrl),
          ),
        ),
        const Gap(20),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorName.secondary,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 25,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 5,
                ),
                child: Text(
                  description,
                  textAlign: TextAlign.justify,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget imageBuilder(String? url) {
    if (url == null) {
      return Assets.images.placeholder.food.image(
        fit: BoxFit.cover,
      );
    }

    return Image.network(
      url,
      fit: BoxFit.cover,
    );
  }
}
