import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_kit/core/common/widgets/loader.dart';
import 'package:nutri_kit/features/deficiency/presentation/bloc/deficiency_detail_bloc.dart';
import 'package:nutri_kit/features/deficiency/presentation/widgets/index.dart';
import 'package:quickalert/quickalert.dart';

class DeficiencyDetailPage extends StatefulWidget {
  const DeficiencyDetailPage({
    super.key,
    required this.id,
  });

  final String id;

  @override
  State<DeficiencyDetailPage> createState() => _DeficiencyDetailPageState();
}

class _DeficiencyDetailPageState extends State<DeficiencyDetailPage>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
    context
        .read<DeficiencyDetailBloc>()
        .add(GetDeficiencyDetailEvent(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<DeficiencyDetailBloc, DeficiencyDetailState>(
        listener: blocListener,
        builder: (context, state) {
          if (state is DeficiencyDetailFailure) {
            return const Center(
              child: Text(
                'Something went wrong in our server, please try again later.',
              ),
            );
          }

          if (state is DeficiencyDetailSuccess) {
            final data = state.deficiencyDetailEntity;

            return CustomScrollView(
              slivers: [
                const SliverAppBar(
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text('Deficiency'),
                  ),
                ),
                SliverToBoxAdapter(
                  child: DeficiencyInfo(
                    title: data.name,
                    description: data.description,
                  ),
                ),
                SliverPersistentHeader(
                  delegate: DeficiencyTabs(
                    tabController: tabController,
                    maxHeight: 120,
                    minHeight: 100,
                    remedies: data.remedies,
                    symptoms: data.symptoms,
                  ),
                ),
              ],
            );
          }

          return const SizedBox();
        },
      ),
    );
  }

  // DeficiencyInfo(
  //                     title: data.name,
  //                     description: data.description,
  //                   ),
  //                   DeficiencyTabs(
  //                     tabController: tabController,
  //                     remedies: data.remedies,
  //                     symptoms: data.symptoms,
  //                   ),

  void onPageError(String message) {
    Future.delayed(const Duration(milliseconds: 600), () {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: 'Oops...',
        text: message,
      );
    });
  }

  void blocListener(BuildContext context, DeficiencyDetailState state) {
    if (state is DeficiencyDetailLoading) {
      LoadingScreen.instance().show(context: context);
    }

    if (state is DeficiencyDetailSuccess || state is DeficiencyDetailFailure) {
      Future.delayed(const Duration(milliseconds: 500), () {
        LoadingScreen.instance().hide();
      });
    }

    if (state is DeficiencyDetailFailure) {
      onPageError(state.message);
    }
  }
}
