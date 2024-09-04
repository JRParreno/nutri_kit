import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nutri_kit/features/meal/presentation/blocs/child_health_list/child_health_list_bloc.dart';
import 'package:nutri_kit/features/meal/presentation/widgets/user_child_list/index.dart';
import 'package:nutri_kit/gen/colors.gen.dart';
import 'package:nutri_kit/router/index.dart';

class UserChildListPage extends StatefulWidget {
  const UserChildListPage({super.key});

  @override
  State<UserChildListPage> createState() => _UserChildListPageState();
}

class _UserChildListPageState extends State<UserChildListPage> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    handleEventScrollListener();
    context.read<ChildHealthListBloc>().add(OnGetChildHealthListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Child List',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<ChildHealthListBloc, ChildHealthListState>(
          builder: (context, state) {
            if (state is ChildHealthListLoading) {
              return const SizedBox.expand(
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              );
            }

            if (state is ChildHealthListFailure) {
              return Expanded(
                child: Center(
                  child: Text(
                    state.message,
                  ),
                ),
              );
            }

            if (state is ChildHealthListSuccess) {
              if (state.userMealPlanResponseEntity.results.isEmpty) {
                return const EmptyChildList();
              }

              return UserChildList(
                scrollController: scrollController,
                childHealthListSuccess: state,
              );
            }

            return const SizedBox();
          },
        ),
      ),
      floatingActionButton:
          BlocSelector<ChildHealthListBloc, ChildHealthListState, bool>(
        selector: (state) {
          if (state is ChildHealthListSuccess) {
            return state.userMealPlanResponseEntity.results.isNotEmpty;
          }
          return false;
        },
        builder: (context, state) {
          return state
              ? FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () {
                    context
                        .pushNamed(AppRoutes.firstCreateChildHealthForm.name);
                  },
                  child: const Icon(
                    Icons.add,
                    color: ColorName.secondary,
                  ),
                )
              : const SizedBox();
        },
      ),
    );
  }

  void handleEventScrollListener() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >
          (scrollController.position.pixels * 0.75)) {
        context
            .read<ChildHealthListBloc>()
            .add(OnPaginateChildHealthListEvent());
      }
    });
  }
}
