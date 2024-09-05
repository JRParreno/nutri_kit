import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:nutri_kit/features/deficiency/domain/entities/index.dart';
import 'package:nutri_kit/features/remedy/domain/entities/index.dart';
import 'package:nutri_kit/features/search/presentation/widgets/index.dart';
import 'package:nutri_kit/gen/assets.gen.dart';
import 'package:nutri_kit/gen/colors.gen.dart';
import 'package:nutri_kit/router/index.dart';

class DeficiencyTabs extends StatelessWidget {
  const DeficiencyTabs({
    super.key,
    required this.tabController,
    required this.symptoms,
    required this.remedies,
  });

  final TabController tabController;
  final List<SymptomEntity> symptoms;
  final List<RemedyEntity> remedies;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        const Gap(15),
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorName.secondary,
          ),
          child: TabBar(
            controller: tabController,
            labelColor: ColorName.secondary,
            unselectedLabelColor: ColorName.miniCardBg,
            indicatorColor: ColorName.secondary,
            dividerHeight: 0,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: const BoxDecoration(
              color: ColorName.miniCardBg,
            ),
            tabs: const [
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
            controller: tabController,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: symptoms
                    .map(
                      (e) => Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: ColorName.detailBg,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '• ${e.name}',
                              style: const TextStyle(
                                fontSize: 17,
                                color: ColorName.miniCardBg,
                              ),
                            ),
                            const Gap(3),
                            Text(
                              e.description,
                              style: const TextStyle(
                                fontSize: 14,
                                color: ColorName.miniCardBg,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: remedies
                    .map(
                      (e) => SearchTileItem(
                        defaultImage: Assets.images.placeholder.remedy.image(),
                        title: e.name,
                        description: e.description,
                        onTap: () {
                          context.pushNamed(
                            AppRoutes.remedyDetail.name,
                            pathParameters: {"id": e.id.toString()},
                          );
                        },
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
