// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:nutri_kit/features/meal/presentation/blocs/child_health_list/child_health_list_bloc.dart';
import 'package:nutri_kit/gen/colors.gen.dart';
import 'package:nutri_kit/router/index.dart';

class UserChildList extends StatelessWidget {
  const UserChildList({
    super.key,
    required this.childHealthListSuccess,
    required this.scrollController,
  });

  final ChildHealthListSuccess childHealthListSuccess;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: RefreshIndicator(
        onRefresh: () {
          context.read<ChildHealthListBloc>().add(OnGetChildHealthListEvent());
          return Future<void>.value();
        },
        child: ListView.separated(
          controller: scrollController,
          itemBuilder: (context, index) {
            final item = childHealthListSuccess
                .userMealPlanResponseEntity.results[index];
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    context.pushNamed(
                      AppRoutes.chidlMealPlanDetailPage.name,
                      pathParameters: {
                        "mealPlanId": item.mealPlan.toString(),
                        "userMealPlanId": item.id.toString(),
                      },
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: ColorName.miniCardBg,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              item.healthStatus.status,
                              style: const TextStyle(
                                color: ColorName.secondary,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        const Icon(Icons.chevron_right),
                      ],
                    ),
                  ),
                ),
                if (childHealthListSuccess.isPaginate &&
                    (childHealthListSuccess
                                .userMealPlanResponseEntity.results.length -
                            1 ==
                        index))
                  const SizedBox(
                    height: 100,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemCount:
              childHealthListSuccess.userMealPlanResponseEntity.results.length,
        ),
      ),
    );
  }
}
