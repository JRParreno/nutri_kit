import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      ),
      body: BlocConsumer<RemedyDetailBloc, RemedyDetailState>(
        listener: blocListener,
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
                  children: [
                    RemedyInfo(
                      descrition: data.description,
                      subTitle: data.scientificName,
                      title: data.name,
                      imageUrl: data.image,
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

  void blocListener(BuildContext context, RemedyDetailState state) {
    if (state is RemedyDetailLoading) {
      LoadingScreen.instance().show(context: context);
    }

    if (state is RemedyDetailSuccess || state is RemedyDetailFailure) {
      Future.delayed(const Duration(milliseconds: 500), () {
        LoadingScreen.instance().hide();
      });
    }

    if (state is RemedyDetailFailure) {
      onPageError(state.message);
    }
  }
}
