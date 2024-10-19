import 'package:flutter/material.dart';
import 'package:nutri_kit/gen/assets.gen.dart';
import 'package:nutri_kit/gen/colors.gen.dart';

class HealthStatusSelection extends StatelessWidget {
  const HealthStatusSelection(
      {super.key, required this.selectedIndex, required this.onTapCard});

  final int selectedIndex;
  final Function(int index) onTapCard;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0, // gap between adjacent chips
      runSpacing: 8.0, // gap between lines
      children: <Widget>[
        imageButton(
          onTap: () => onTapCard(0),
          isSelected: selectedIndex == 0,
          image: Assets.images.meal.underweight.image(),
          title: 'Underweight',
        ),
        imageButton(
          onTap: () => onTapCard(1),
          isSelected: selectedIndex == 1,
          image: Assets.images.meal.waisted.image(),
          title: 'Wasted',
        ),
        imageButton(
          onTap: () => onTapCard(2),
          isSelected: selectedIndex == 2,
          image: Assets.images.meal.stunted.image(),
          title: 'Stunted',
        ),
        imageButton(
          onTap: () => onTapCard(3),
          isSelected: selectedIndex == 3,
          image: Assets.images.meal.obese.image(),
          title: 'Obese',
        ),
      ],
    );
  }

  Widget imageButton({
    required Image image,
    required String title,
    required VoidCallback onTap,
    bool isSelected = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 120,
        width: 120,
        decoration: BoxDecoration(
          color: isSelected ? ColorName.primary : ColorName.secondary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 90,
              width: 90,
              child: image,
            ),
            Text(title)
          ],
        ),
      ),
    );
  }
}
