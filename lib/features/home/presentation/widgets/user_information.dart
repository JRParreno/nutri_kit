// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:nutri_kit/gen/colors.gen.dart';

class UserInformation extends StatelessWidget {
  const UserInformation({
    super.key,
    required this.firstName,
  });

  final String firstName;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Hello $firstName',
          style: textTheme.headlineSmall?.copyWith(fontSize: 25),
        ),
        Text(
          'Find, track and eat healthy food',
          style: textTheme.bodyLarge?.copyWith(
            fontSize: 18,
            color: ColorName.link,
          ),
        ),
      ],
    );
  }
}
