import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nutri_kit/gen/colors.gen.dart';

class ChildDetail extends StatelessWidget {
  const ChildDetail({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.person_outline,
            color: ColorName.secondary,
            size: 45,
          ),
          Column(
            children: [
              Text(
                'Hi $name',
                style: textStyle(),
              ),
              Text(
                'Today ${dateFormatted()}',
                style: textStyle(
                  Colors.black,
                ),
              ),
            ],
          ),
          const Icon(
            Icons.notifications_outlined,
            color: ColorName.secondary,
            size: 45,
          ),
        ],
      ),
    );
  }

  String dateFormatted() {
    return DateFormat('d, MMM').format(DateTime.now());
  }

  TextStyle textStyle([Color textColor = ColorName.secondary]) {
    return TextStyle(
      color: textColor,
      fontSize: 18,
    );
  }
}
