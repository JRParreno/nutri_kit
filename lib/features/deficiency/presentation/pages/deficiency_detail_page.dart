import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_kit/core/common/widgets/loader.dart';
import 'package:nutri_kit/features/deficiency/presentation/bloc/deficiency_detail_bloc.dart';
import 'package:nutri_kit/features/deficiency/presentation/widgets/index.dart';
import 'package:nutri_kit/features/favorite/presentation/blocs/deficiency/favorite_deficiency_bloc.dart';
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
  int index = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    )..addListener(
        () {
          setState(() {
            index = tabController.index;
          });
        },
      );

    context
        .read<DeficiencyDetailBloc>()
        .add(GetDeficiencyDetailEvent(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Deficiency',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          BlocSelector<DeficiencyDetailBloc, DeficiencyDetailState, bool>(
            selector: (state) {
              if (state is DeficiencyDetailSuccess) {
                return state.deficiencyDetailEntity.isFavorite;
              }
              return false;
            },
            builder: (context, state) {
              return IconButton(
                onPressed: () => handleOnTapFavorite(state),
                icon: Icon(
                  state ? Icons.favorite : Icons.favorite_outline,
                ),
              );
            },
          )
        ],
      ),
      body: SizedBox.expand(
        child: BlocConsumer<DeficiencyDetailBloc, DeficiencyDetailState>(
          listener: blocListener,
          buildWhen: (previous, current) {
            if (previous is DeficiencyDetailLoading &&
                current is DeficiencyDetailSuccess &&
                current.message.isEmpty) {
              return true;
            }
            return false;
          },
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

              return Container(
                padding: const EdgeInsets.all(25),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            DeficiencyInfo(
                              title: data.name,
                              description: data.description,
                            ),
                            DeficiencyTabs(
                              tabController: tabController,
                              remedies: data.remedies,
                              symptoms: data.symptoms,
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (index == 0)
                      const Text(
                          "**If symptoms worsen, it's important to seek medical advice from a doctor.**")
                  ],
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }

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

  void onPageSuccess({
    required String message,
    bool isFavorite = false,
  }) {
    context.read<FavoriteDeficiencyBloc>().add(GetFavoriteDeficiencyEvent());

    Future.delayed(const Duration(milliseconds: 600), () {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        title: 'Deficiency',
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

    if (state is DeficiencyDetailSuccess && state.message.isNotEmpty) {
      onPageSuccess(
        message: state.message,
        isFavorite: state.deficiencyDetailEntity.isFavorite,
      );
    }

    if (state is DeficiencyDetailFailure) {
      onPageError(state.message);
    }
  }

  void handleOnTapFavorite(bool isFavorite) {
    if (isFavorite) {
      context.read<DeficiencyDetailBloc>().add(DeleteFavoriteDeficiencyEvent());
      return;
    }
    context.read<DeficiencyDetailBloc>().add(AddFavoriteDeficiencyEvent());
  }
}
