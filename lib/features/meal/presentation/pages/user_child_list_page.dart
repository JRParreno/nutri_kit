import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_kit/features/meal/presentation/blocs/child_health_list/child_health_list_bloc.dart';
import 'package:nutri_kit/features/meal/presentation/widgets/user_child_list/index.dart';

class UserChildListPage extends StatefulWidget {
  const UserChildListPage({super.key});

  @override
  State<UserChildListPage> createState() => _UserChildListPageState();
}

class _UserChildListPageState extends State<UserChildListPage> {
  @override
  void initState() {
    super.initState();
    context.read<ChildHealthListBloc>().add(OnGetChildHealthListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

              return const Text('True');
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
