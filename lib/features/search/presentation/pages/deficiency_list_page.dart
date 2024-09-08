import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:nutri_kit/features/search/presentation/blocs/search_deficiency/search_deficiency_bloc.dart';
import 'package:nutri_kit/features/search/presentation/widgets/index.dart';
import 'package:nutri_kit/gen/assets.gen.dart';
import 'package:nutri_kit/router/index.dart';

class DeficiencyListPage extends StatefulWidget {
  const DeficiencyListPage({super.key, required this.keyword});

  final String keyword;

  @override
  State<DeficiencyListPage> createState() => _DeficiencyListPageState();
}

class _DeficiencyListPageState extends State<DeficiencyListPage> {
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<SearchDeficiencyBloc>().add(
          GetSearchDeficiencyEvent(widget.keyword),
        );
    handleEventScrollListener();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search Deficiency',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: BlocBuilder<SearchDeficiencyBloc, SearchDeficiencyState>(
            builder: (context, state) {
              if (state is SearchDeficiencyLoading) {
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

              if (state is SearchDeficiencyFailure) {
                return const Center(
                  child: Text(
                    'Something went wrong in our server, please try again later.',
                  ),
                );
              }

              if (state is SearchListDeficiencySuccess) {
                if (state.data.results.isEmpty) {
                  return const Center(
                    child: Text(
                      'No search found.',
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
            .read<SearchDeficiencyBloc>()
            .add(PaginateSearchDeficiencyEvent(widget.keyword));
      }
    });
  }
}
