import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nutri_kit/gen/colors.gen.dart';

class DeficiencyInfo extends StatelessWidget {
  const DeficiencyInfo({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 42),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: ColorName.miniCardBg,
            ),
            child: Text(
              description,
              style: const TextStyle(
                color: ColorName.secondary,
                fontSize: 18,
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: ColorName.secondary,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
