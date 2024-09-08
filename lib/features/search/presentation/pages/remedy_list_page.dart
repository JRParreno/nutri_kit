import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:nutri_kit/features/search/presentation/blocs/search_remedy/search_remedy_bloc.dart';
import 'package:nutri_kit/features/search/presentation/widgets/index.dart';
import 'package:nutri_kit/gen/assets.gen.dart';
import 'package:nutri_kit/router/index.dart';

class RemedyListPage extends StatefulWidget {
  const RemedyListPage({super.key, required this.keyword});
  final String keyword;

  @override
  State<RemedyListPage> createState() => _RemedyListPageState();
}

class _RemedyListPageState extends State<RemedyListPage> {
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<SearchRemedyBloc>().add(GetSearchRemedyEvent(widget.keyword));
    handleEventScrollListener();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search Remedy',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: BlocBuilder<SearchRemedyBloc, SearchRemedyState>(
            builder: (context, state) {
              if (state is SearchRemedyLoading) {
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

              if (state is SearchRemedyFailure) {
                return const Center(
                  child: Text(
                    'Something went wrong in our server, please try again later.',
                  ),
                );
              }

              if (state is SearchListRemedySuccess) {
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
                              AppRoutes.foodDetail.name,
                              pathParameters: {"id": item.id.toString()},
                            );
                          },
                          defaultImage:
                              Assets.images.placeholder.remedy.image(),
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
            .read<SearchRemedyBloc>()
            .add(PaginateSearchRemedyEvent(widget.keyword));
      }
    });
  }
}
