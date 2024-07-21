import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:nutri_kit/features/search/presentation/blocs/search/search_bloc.dart';
import 'package:nutri_kit/features/search/presentation/widgets/index.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            SearchField(
              controller: searchController,
              hintText: "Search",
              onSearch: () {
                if (searchController.text.trim().isNotEmpty) {
                  context.read<SearchBloc>().add(
                        SearchTriggerEvent(
                          searchController.text,
                        ),
                      );
                }
              },
              onChanged: () {
                setState(() {});
              },
            ),
            const Gap(30),
            BlocConsumer<SearchBloc, SearchState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is SearchLoading) {
                  return const Expanded(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircularProgressIndicator(
                            color: Colors.white,
                          ),
                          Gap(10),
                          Text('Searching, please wait...'),
                        ],
                      ),
                    ),
                  );
                }

                if (state is SearchEmpty) {
                  return const Expanded(
                    child: Center(
                      child: Text(
                        'Sorry, No result found :(',
                      ),
                    ),
                  );
                }

                if (state is SearchFailure) {
                  return const Expanded(
                    child: Center(
                      child: Text(
                        'Something went wrong in our server, please try again later.',
                      ),
                    ),
                  );
                }

                if (state is SearchSuccess) {
                  return Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SearchDeficiencySuccess(
                            data: state.deficiencyResponse,
                          ),
                          const Gap(20),
                          SearchFoodSuccess(
                            data: state.foodResponse,
                          ),
                          const Gap(20),
                          SearchRemedySuccess(
                            data: state.remediesResponse,
                          ),
                          const Gap(20),
                          SearchVitaminSuccess(
                            data: state.vitaminResponse,
                          ),
                          const Gap(40),
                        ],
                      ),
                    ),
                  );
                }

                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
