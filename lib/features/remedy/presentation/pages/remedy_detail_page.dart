import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:nutri_kit/core/common/widgets/loader.dart';
import 'package:nutri_kit/features/remedy/presentation/bloc/remedy_detail_bloc.dart';
import 'package:nutri_kit/features/remedy/presentation/widgets/index.dart';
import 'package:quickalert/quickalert.dart';

class RemedyDetailPage extends StatefulWidget {
  const RemedyDetailPage({
    super.key,
    required this.id,
  });

  final String id;

  @override
  State<RemedyDetailPage> createState() => _RemedyDetailPageState();
}

class _RemedyDetailPageState extends State<RemedyDetailPage> {
  @override
  void initState() {
    super.initState();
    context.read<RemedyDetailBloc>().add(GetRemedyDetailEvent(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Remedy',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          BlocSelector<RemedyDetailBloc, RemedyDetailState, bool>(
            selector: (state) {
              if (state is RemedyDetailSuccess) {
                return state.remedyDetailEntity.isFavorite;
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
      body: BlocConsumer<RemedyDetailBloc, RemedyDetailState>(
        listener: blocListener,
        buildWhen: (previous, current) {
          if (previous is RemedyDetailSuccess &&
              current is RemedyDetailSuccess) {
            return false;
          }
          return true;
        },
        builder: (context, state) {
          if (state is RemedyDetailFailure) {
            return const Center(
              child: Text(
                'Something went wrong in our server, please try again later.',
              ),
            );
          }

          if (state is RemedyDetailSuccess) {
            final data = state.remedyDetailEntity;

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(35.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RemedyInfo(
                      descrition: data.description,
                      subTitle: data.scientificName,
                      title: data.name,
                      imageUrl: data.image,
                    ),
                    const Gap(25),
                    RemedyRecommendedMeal(
                      foods: state.remedyDetailEntity.foods,
                    ),
                  ],
                ),
              ),
            );
          }

          return const SizedBox();
        },
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
    Future.delayed(const Duration(milliseconds: 600), () {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        title: '${isFavorite ? 'Add' : 'Remove'} Favorite',
        text: message,
      );
    });
  }

  void blocListener(BuildContext context, RemedyDetailState state) {
    if (state is RemedyDetailLoading) {
      LoadingScreen.instance().show(context: context);
    }

    if (state is RemedyDetailSuccess || state is RemedyDetailFailure) {
      Future.delayed(const Duration(milliseconds: 500), () {
        LoadingScreen.instance().hide();
      });
    }

    if (state is RemedyDetailSuccess && state.message.isNotEmpty) {
      onPageSuccess(
        message: state.message,
        isFavorite: state.remedyDetailEntity.isFavorite,
      );
    }

    if (state is RemedyDetailFailure) {
      onPageError(state.message);
    }
  }

  void handleOnTapFavorite(bool isFavorite) {
    if (isFavorite) {
      context.read<RemedyDetailBloc>().add(DeleteFavoriteRemedyEvent());
      return;
    }
    context.read<RemedyDetailBloc>().add(AddFavoriteRemedyEvent());
  }
}
