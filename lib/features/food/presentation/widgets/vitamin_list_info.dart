import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:nutri_kit/features/food/domain/entities/index.dart';
import 'package:nutri_kit/router/index.dart';

class VitamiListInfo extends StatelessWidget {
  const VitamiListInfo({
    super.key,
    required this.vitamins,
    this.isTapEnabled = false,
  });

  final List<VitaminEntity> vitamins;
  final bool isTapEnabled;

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
                return GestureDetector(
                  onTap: isTapEnabled
                      ? () {
                          context.pushNamed(
                            AppRoutes.vitaminDetail.name,
                            pathParameters: {
                              "id": vitamins[index].id.toString()
                            },
                          );
                        }
                      : null,
                  child: Chip(
                    padding: const EdgeInsets.all(1),
                    label: Text(
                      vitamins[index].name,
                      style: textTheme.labelSmall?.copyWith(
                        color: Colors.grey.shade500,
                      ),
                      maxLines: 1,
                    ),
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
