import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:nutri_kit/features/favorite/presentation/blocs/deficiency/favorite_deficiency_bloc.dart';
import 'package:nutri_kit/features/search/presentation/widgets/index.dart';
import 'package:nutri_kit/gen/assets.gen.dart';
import 'package:nutri_kit/router/index.dart';

class DeficiencyFavoriteListPage extends StatefulWidget {
  const DeficiencyFavoriteListPage({super.key});

  @override
  State<DeficiencyFavoriteListPage> createState() =>
      _DeficiencyFavoriteListPageState();
}

class _DeficiencyFavoriteListPageState
    extends State<DeficiencyFavoriteListPage> {
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<FavoriteDeficiencyBloc>().add(GetFavoriteDeficiencyEvent());
    handleEventScrollListener();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favorite Deficiency',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: BlocBuilder<FavoriteDeficiencyBloc, FavoriteDeficiencyState>(
            builder: (context, state) {
              if (state is FavoriteDeficiencyLoading) {
                return const Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircularProgressIndicator(
                        color: Colors.white,
                      ),
                      Gap(10),
                      Text('Loading, please wait...'),
                    ],
                  ),
                );
              }

              if (state is FavoriteDeficiencyFailure) {
                return const Center(
                  child: Text(
                    'Something went wrong in our server, please try again later.',
                  ),
                );
              }

              if (state is FavoriteDeficiencySuccess) {
                if (state.data.results.isEmpty) {
                  return const Center(
                    child: Text(
                      'No favorite found.',
                    ),
                  );
                }

                return ListView.separated(
                  controller: controller,
                  itemBuilder: (context, index) {
                    final item = state.data.results[index];
                    //  index != (state.data.results.length - 1)
                    return Column(
                      children: [
                        SearchTileItem(
                          onTap: () {
                            context.pushNamed(
                              AppRoutes.deficiencyDetail.name,
                              pathParameters: {"id": item.id.toString()},
                            );
                          },
                          defaultImage:
                              Assets.images.placeholder.deficiency.image(),
                          title: item.name,
                          description: item.description,
                        ),
                        if (index == (state.data.results.length - 1) &&
                            state.isPaginate)
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
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemCount: state.data.results.length,
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }

  void handleEventScrollListener() {
    controller.addListener(() {
      if (controller.position.pixels > (controller.position.pixels * 0.75)) {
        context
            .read<FavoriteDeficiencyBloc>()
            .add(PaginateFavoriteDeficiencyEvent());
      }
    });
  }
}
