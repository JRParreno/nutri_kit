import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:nutri_kit/features/meal/presentation/widgets/user_child_list/index.dart';
import 'package:nutri_kit/gen/colors.gen.dart';

class BirthdateForm extends StatelessWidget {
  const BirthdateForm({
    super.key,
    required this.controller,
    required this.onSelectedBirthdate,
  });

  final TextEditingController controller;
  final Function(String value) onSelectedBirthdate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Birthdate',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w500,
            color: ColorName.secondary,
          ),
        ),
        const Gap(10),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: GestureDetector(
            onTap: () => handleOnTapBirthdate(context),
            child: StepperTextField(
              enabled: false,
              keyboardType: TextInputType.number,
              controller: controller,
              hintText: 'MM/DD/YYYY',
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
          ),
        ),
      ],
    );
  }

  void handleOnTapBirthdate(BuildContext context) async {
    final now = DateTime.now();
    final birthdate = await showDatePicker(
      context: context,
      firstDate: DateTime(1900, 1, 1),
      lastDate: DateTime(now.year - 1, now.month, now.day),
      currentDate: DateTime.now(),
    );

    if (birthdate != null) {
      onSelectedBirthdate(DateFormat.yMd().format(birthdate));
    }
  }
}
