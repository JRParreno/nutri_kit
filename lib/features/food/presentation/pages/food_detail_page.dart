import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:nutri_kit/core/common/widgets/loader.dart';
import 'package:nutri_kit/features/food/presentation/bloc/food_detail_bloc.dart';
import 'package:nutri_kit/features/food/presentation/widgets/index.dart';
import 'package:quickalert/quickalert.dart';

class FoodDetailPage extends StatefulWidget {
  const FoodDetailPage({
    super.key,
    required this.id,
  });

  final String id;

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  @override
  void initState() {
    super.initState();
    context.read<FoodDetailBloc>().add(GetFoodDetailEvent(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Food',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          BlocSelector<FoodDetailBloc, FoodDetailState, bool>(
            selector: (state) {
              if (state is FoodDetailSuccess) {
                return state.foodEntity.isFavorite;
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
      body: BlocConsumer<FoodDetailBloc, FoodDetailState>(
        listener: blocListener,
        buildWhen: (previous, current) {
          if (previous is FoodDetailLoading &&
              current is FoodDetailSuccess &&
              current.message.isEmpty) {
            return true;
          }
          return false;
        },
        builder: (context, state) {
          if (state is FoodDetailFailure) {
            return const Center(
              child: Text(
                'Something went wrong in our server, please try again later.',
              ),
            );
          }

          if (state is FoodDetailSuccess) {
            final data = state.foodEntity;

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(35.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FoodInfo(
                      description: data.description,
                      title: data.name,
                      category: data.category.name,
                      scientificName: data.scientificName,
                      imageUrl: data.image,
                    ),
                    const Gap(25),
                    VitamiListInfo(
                      vitamins: data.vitamins,
                      isTapEnabled: true,
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
        title: 'Food',
        text: message,
      );
    });
  }

  void blocListener(BuildContext context, FoodDetailState state) {
    if (state is FoodDetailLoading) {
      LoadingScreen.instance().show(context: context);
    }

    if (state is FoodDetailSuccess || state is FoodDetailFailure) {
      Future.delayed(const Duration(milliseconds: 500), () {
        LoadingScreen.instance().hide();
      });
    }

    if (state is FoodDetailSuccess && state.message.isNotEmpty) {
      onPageSuccess(
        message: state.message,
        isFavorite: state.foodEntity.isFavorite,
      );
    }

    if (state is FoodDetailFailure) {
      onPageError(state.message);
    }
  }

  void handleOnTapFavorite(bool isFavorite) {
    if (isFavorite) {
      context.read<FoodDetailBloc>().add(DeleteFavoriteFoodEvent());
      return;
    }
    context.read<FoodDetailBloc>().add(AddFavoriteFoodEvent());
  }
}
