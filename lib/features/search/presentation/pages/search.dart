import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:nutri_kit/features/search/presentation/blocs/search/search_bloc.dart';
import 'package:nutri_kit/features/search/presentation/widgets/search_field.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<SearchBloc>().add(const SearchTriggerEvent("1s"));
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
              onSearch: () {},
              onChanged: () {
                setState(() {});
              },
            ),
            const Gap(30),
            BlocConsumer<SearchBloc, SearchState>(
              listener: (context, state) {},
              builder: (context, state) {
                return const Placeholder();
              },
            ),
          ],
        ),
      ),
    );
  }
}
