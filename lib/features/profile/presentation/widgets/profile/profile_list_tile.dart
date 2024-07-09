// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:nutri_kit/gen/colors.gen.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    super.key,
    required this.iconData,
    required this.title,
    required this.onTap,
  });

  final IconData iconData;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Icon(
                  iconData,
                  size: 30,
                  color: ColorName.secondary,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(fontSize: 17, color: Color(0xff707070)),
              ),
            ],
          ),
          const Icon(
            Icons.chevron_right,
            size: 30,
            color: Color(0xff909090),
          )
        ],
      ),
    );
  }
}
