import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_kit/core/common/widgets/loader.dart';
import 'package:nutri_kit/features/favorite/presentation/blocs/vitamin/favorite_vitamin_bloc.dart';
import 'package:nutri_kit/features/food/presentation/bloc/vitamin_detail/vitamin_detail_bloc.dart';
import 'package:nutri_kit/features/food/presentation/widgets/index.dart';
import 'package:quickalert/quickalert.dart';

class VitaminDetailPage extends StatefulWidget {
  const VitaminDetailPage({
    super.key,
    required this.id,
  });

  final String id;

  @override
  State<VitaminDetailPage> createState() => _VitaminDetailPageState();
}

class _VitaminDetailPageState extends State<VitaminDetailPage> {
  @override
  void initState() {
    super.initState();
    context.read<VitaminDetailBloc>().add(
          GetVitaminDetailEvent(widget.id),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Vitamin',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          BlocSelector<VitaminDetailBloc, VitaminDetailState, bool>(
            selector: (state) {
              if (state is VitaminDetailSuccess) {
                return state.vitaminEntity.isFavorite;
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
      body: BlocConsumer<VitaminDetailBloc, VitaminDetailState>(
        listener: blocListener,
        buildWhen: (previous, current) {
          if (previous is VitaminDetailLoading &&
              current is VitaminDetailSuccess &&
              current.message.isEmpty) {
            return true;
          }
          return false;
        },
        builder: (context, state) {
          if (state is VitaminDetailFailure) {
            return const Center(
              child: Text(
                'Something went wrong in our server, please try again later.',
              ),
            );
          }

          if (state is VitaminDetailSuccess) {
            final data = state.vitaminEntity;

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(35.0),
                child: VitaminInfo(
                  description: data.description,
                  title: data.name,
                  imageUrl: data.image,
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
    context.read<FavoriteVitaminBloc>().add(GetFavoriteVitaminEvent());

    Future.delayed(const Duration(milliseconds: 600), () {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        title: 'Vitamin',
        text: message,
      );
    });
  }

  void blocListener(BuildContext context, VitaminDetailState state) {
    if (state is VitaminDetailLoading) {
      LoadingScreen.instance().show(context: context);
    }

    if (state is VitaminDetailSuccess || state is VitaminDetailFailure) {
      Future.delayed(const Duration(milliseconds: 500), () {
        LoadingScreen.instance().hide();
      });
    }

    if (state is VitaminDetailSuccess && state.message.isNotEmpty) {
      onPageSuccess(
        message: state.message,
        isFavorite: state.vitaminEntity.isFavorite,
      );
    }

    if (state is VitaminDetailFailure) {
      onPageError(state.message);
    }
  }

  void handleOnTapFavorite(bool isFavorite) {
    if (isFavorite) {
      context.read<VitaminDetailBloc>().add(DeleteFavoriteVitaminEvent());
      return;
    }
    context.read<VitaminDetailBloc>().add(AddFavoriteVitaminEvent());
  }
}
