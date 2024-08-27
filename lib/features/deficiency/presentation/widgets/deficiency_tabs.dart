// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:nutri_kit/features/deficiency/domain/entities/index.dart';
import 'package:nutri_kit/features/remedy/domain/entities/index.dart';
import 'package:nutri_kit/gen/colors.gen.dart';

class DeficiencyTabs extends SliverPersistentHeaderDelegate {
  DeficiencyTabs({
    required this.tabController,
    required this.symptoms,
    required this.remedies,
    required this.minHeight,
    required this.maxHeight,
  });

  final TabController tabController;
  final List<SymptomEntity> symptoms;
  final List<RemedyEntity> remedies;
  final double minHeight;
  final double maxHeight;

  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return DefaultTabController(
      length: 2,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const Gap(15),
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorName.miniCardBg,
            ),
            child: const TabBar(
              labelColor: ColorName.miniCardBg,
              unselectedLabelColor: ColorName.secondary,
              indicatorColor: ColorName.secondary,
              dividerHeight: 0,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                color: ColorName.secondary,
              ),
              tabs: [
                Tab(
                  child: Text(
                    'Symptoms',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                Tab(
                  child: Text(
                    'Remedies',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ],
            ),
          ),
          const Gap(15),
          SizedBox(
            height: 350,
            child: TabBarView(
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: ColorName.miniCardBg,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: symptoms
                        .map(
                          (e) => Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              '• ${e.name}',
                              style: const TextStyle(
                                fontSize: 17,
                                color: ColorName.secondary,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: ColorName.miniCardBg,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: remedies
                        .map(
                          (e) => Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              '• ${e.name}',
                              style: const TextStyle(
                                fontSize: 17,
                                color: ColorName.secondary,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(DeficiencyTabs oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight;
  }
}
