import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:nutri_kit/features/home/domain/entities/index.dart';
import 'package:nutri_kit/features/home/presentation/bloc/trivia_bloc/trivia_bloc.dart';
import 'package:nutri_kit/features/home/presentation/bloc/trivia_slider/trivia_selected_slider_cubit.dart';
import 'package:nutri_kit/gen/colors.gen.dart';

class TriviaSlider extends StatelessWidget {
  const TriviaSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: BlocBuilder<TriviaBloc, TriviaState>(
        builder: (context, state) {
          if (state is TriviaLoading) {
            return const Text('Loading....');
          }

          if (state is TriviaLoaded) {
            final results = state.triviaResponse.results;
            return Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: results.length > 1,
                    viewportFraction: 1,
                    enableInfiniteScroll: results.length > 1,
                    onPageChanged: (index, reason) {
                      if (results.length > 1) {
                        context
                            .read<TriviaSelectedSliderCubit>()
                            .updateSelectedIndicator(index);
                      }
                    },
                  ),
                  items: results.map((item) => carouselCard(item)).toList(),
                ),
                if (results.length > 1) ...[
                  const Gap(10),
                  BlocBuilder<TriviaSelectedSliderCubit, int>(
                    builder: (context, state) {
                      return Row(
                        children: results
                            .map(
                              (item) => Container(
                                height: 15,
                                width: 20,
                                margin: const EdgeInsets.only(right: 5),
                                decoration: BoxDecoration(
                                  color: state == results.indexOf(item)
                                      ? const Color(0xff69D7C4)
                                      : ColorName.secondary,
                                  borderRadius: BorderRadius.circular(
                                    5,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      );
                    },
                  ),
                ],
                const Gap(10),
              ],
            );
          }

          return const SizedBox();
        },
      ),
    );
  }

  Widget carouselCard(Trivia trivia) {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: ColorName.card,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Trivia',
                      style: TextStyle(
                        color: ColorName.primary,
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                    const Gap(5),
                    Text(
                      trivia.questionText,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 17,
                      ),
                      maxLines: 3,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Gap(5),
                  ],
                ),
                SizedBox(
                  height: 40,
                  width: 135,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.only(
                        left: 25,
                      ),
                    ),
                    onPressed: () {},
                    child: const Row(
                      children: [
                        Text(
                          'Read Now',
                          style: TextStyle(
                            fontFamily: 'Signika',
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        Gap(3),
                        Icon(
                          Icons.arrow_right_rounded,
                          color: Colors.white,
                          size: 25,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          if (trivia.questionBanner != null) ...[
            const Gap(8),
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(trivia.questionBanner!),
            ),
          ]
        ],
      ),
    );
  }
}
