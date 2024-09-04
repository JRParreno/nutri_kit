import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nutri_kit/features/meal/presentation/widgets/user_child_list/index.dart';
import 'package:nutri_kit/gen/colors.gen.dart';

class NicknameForm extends StatelessWidget {
  const NicknameForm({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Nickname',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w500,
            color: ColorName.secondary,
          ),
        ),
        const Gap(10),
        StepperTextField(
          controller: controller,
          hintText: "Enter your Chil's nickname",
          fillColor: Colors.white,
          textColor: ColorName.secondary,
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
              width: 0,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    );
  }
}
