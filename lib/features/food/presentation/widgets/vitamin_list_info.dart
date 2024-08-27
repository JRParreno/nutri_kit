import 'package:flutter/material.dart';

import 'package:nutri_kit/features/food/domain/entities/index.dart';

class VitamiListInfo extends StatelessWidget {
  const VitamiListInfo({
    super.key,
    required this.vitamins,
  });

  final List<VitaminEntity> vitamins;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: 75,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Vitamins",
            style: TextStyle(fontSize: 17),
          ),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Chip(
                  padding: const EdgeInsets.all(1),
                  label: Text(
                    vitamins[index].name,
                    style: textTheme.labelSmall?.copyWith(
                      color: Colors.grey.shade500,
                    ),
                    maxLines: 1,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 10,
                );
              },
              itemCount: vitamins.length,
            ),
          )
        ],
      ),
    );
  }
}
