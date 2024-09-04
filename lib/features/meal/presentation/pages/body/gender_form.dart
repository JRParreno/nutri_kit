import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nutri_kit/core/enum/gender.dart';
import 'package:nutri_kit/gen/colors.gen.dart';

class GenderForm extends StatelessWidget {
  const GenderForm({
    super.key,
    required this.onSelect,
    this.selectedGender,
  });

  final Function(String value) onSelect;
  final String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        const Text(
          'Gender',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w500,
            color: ColorName.secondary,
          ),
        ),
        const Gap(53),
        selectBtn(
            title: 'Male',
            onTap: () => onSelect(Gender.male.name),
            context: context,
            selected: selectedGender != null
                ? selectedGender == Gender.male.name
                : false),
        const Gap(25),
        selectBtn(
            title: 'Female',
            onTap: () => onSelect(Gender.female.name),
            context: context,
            selected: selectedGender != null
                ? selectedGender == Gender.female.name
                : false),
      ],
    );
  }

  Widget selectBtn({
    required String title,
    required VoidCallback onTap,
    required BuildContext context,
    bool selected = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 75,
        width: double.infinity,
        decoration: BoxDecoration(
          color: selected ? ColorName.secondary : Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: selected ? Colors.white : ColorName.secondary,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
