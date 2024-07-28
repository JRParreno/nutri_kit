import 'package:flutter/material.dart';
import 'package:nutri_kit/gen/assets.gen.dart';
import 'package:nutri_kit/gen/colors.gen.dart';

class RemedyInfo extends StatelessWidget {
  const RemedyInfo({
    super.key,
    required this.title,
    required this.descrition,
    this.subTitle,
    this.imageUrl,
  });

  final String title;
  final String descrition;
  final String? subTitle;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 30),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorName.secondary,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 115),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      if (subTitle != null)
                        Text(
                          '($subTitle)',
                        )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 48),
                  child: Text(
                    descrition,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            left: 25,
            child: Container(
              height: 100,
              width: 100,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: imageBuild(),
            ),
          )
        ],
      ),
    );
  }

  Widget imageBuild() {
    if (imageUrl == null) {
      return Assets.images.placeholder.remedy.image();
    }

    return Image.network(imageUrl!);
  }
}
