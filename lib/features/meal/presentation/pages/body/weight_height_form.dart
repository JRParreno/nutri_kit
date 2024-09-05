// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';
import 'package:gap/gap.dart';
import 'package:numberpicker/numberpicker.dart';

import 'package:nutri_kit/gen/colors.gen.dart';

class WeightHeightForm extends StatefulWidget {
  const WeightHeightForm({
    super.key,
    required this.heightValue,
    required this.weightValue,
    this.initialHeight,
    this.initialWeight,
  });

  final Function(double value) heightValue;
  final Function(int value) weightValue;
  final double? initialHeight;
  final int? initialWeight;

  @override
  State<WeightHeightForm> createState() => _WeightHeightFormState();
}

class _WeightHeightFormState extends State<WeightHeightForm> {
  RulerPickerController? _rulerPickerController;
  num currentValue = 40;

  int _currentIntValue = 15;

  List<RulerRange> ranges = const [
    RulerRange(begin: 0, end: 200, scale: 0.5),
  ];

  @override
  void initState() {
    super.initState();
    _rulerPickerController = RulerPickerController(value: currentValue);
    currentValue = widget.initialHeight ?? 40;
    _currentIntValue = widget.initialWeight ?? 15;
  }

  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          heightForm(),
          const Gap(50),
          weightForm(),
        ],
      ),
    );
  }

  Widget weightForm() {
    return Column(
      children: [
        const Text(
          'Weight',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w500,
            color: ColorName.secondary,
          ),
        ),
        const Gap(10),
        NumberPicker(
          axis: Axis.horizontal,
          value: _currentIntValue,
          minValue: 0,
          maxValue: 100,
          step: 1,
          infiniteLoop: true,
          haptics: true,
          // itemWidth: 35,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(
              5,
            ),
          ),
          onChanged: (value) {
            setState(() => _currentIntValue = value);
            widget.weightValue(value);
          },
        ),
        const Text(
          'kg',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    );
  }

  Widget heightForm() {
    return Column(
      children: [
        const Text(
          'Height',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w500,
            color: ColorName.secondary,
          ),
        ),
        const Gap(10),
        RulerPicker(
          rulerBackgroundColor: ColorName.primary,
          controller: _rulerPickerController!,
          onBuildRulerScaleText: (index, value) {
            return value.toInt().toString();
          },
          rulerScaleTextStyle: const TextStyle(
            color: Colors.white,
          ),
          ranges: ranges,
          scaleLineStyleList: const [
            ScaleLineStyle(
              color: ColorName.secondary,
              width: 5,
              height: 55,
              scale: 0,
            ),
            ScaleLineStyle(
              color: ColorName.secondary,
              width: 5,
              height: 45,
              scale: 5,
            ),
            ScaleLineStyle(
              color: Colors.white,
              width: 5,
              height: 35,
              scale: -1,
            )
          ],
          onValueChanged: (value) {
            widget.heightValue(value.toDouble());
            setState(() {
              currentValue = value;
            });
          },
          width: MediaQuery.of(context).size.width,
          height: 80,
          rulerMarginTop: 8,
          marker: Container(
            width: 8,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.red.withAlpha(100),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${currentValue.toStringAsFixed(1)} ',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const Text(
              'cm',
              style: TextStyle(
                color: ColorName.secondary,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        )
      ],
    );
  }
}
