import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:nutri_kit/core/config/shared_prefences_keys.dart';
import 'package:nutri_kit/core/notifier/shared_preferences_notifier.dart';
import 'package:nutri_kit/gen/assets.gen.dart';
import 'package:nutri_kit/router/index.dart';

class OnBoardingPage extends StatefulWidget {
  static const String routeName = '/on-boarding';

  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final _introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.45;

    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          key: _introKey,
          pages: [
            PageViewModel(
              title: '',
              bodyWidget: Column(
                children: [
                  Assets.images.onBoarding.eatingHealthyFoodCuate1onBoarding
                      .svg(height: height),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 20,
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Eat Healthy',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.85),
                            fontWeight: FontWeight.w700,
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          'Maintaining good health should be the primary focus of everyone.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black.withOpacity(0.45),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            PageViewModel(
              title: '',
              bodyWidget: Column(
                children: [
                  Assets.images.onBoarding.cookingCuate1onBoarding
                      .svg(height: height),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 20,
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Healthy Recipes',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.85),
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'Browse thousands of healthy recipes from all over the world.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black.withOpacity(0.45),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            PageViewModel(
              title: '',
              bodyWidget: Column(
                children: [
                  Assets.images.onBoarding.mobileCuate1onBoarding
                      .svg(height: height),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 20,
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Track Your Health',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.85),
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'With amazing inbuilt tools you can track your progress.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black.withOpacity(0.45),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
          skip: const Text("Skip"),
          next: const Text("Next"),
          done:
              const Text("Done", style: TextStyle(fontWeight: FontWeight.w700)),
          onDone: () {
            goToHomePage();
          },
          onSkip: () {
            goToHomePage();
          },
          baseBtnStyle: ButtonStyle(
              foregroundColor:
                  WidgetStateProperty.all(Colors.black.withOpacity(0.85))),
          showSkipButton: true,
          dotsDecorator: DotsDecorator(
            activeColor: Colors.black.withOpacity(0.85),
            color: Colors.black.withOpacity(0.3),
          ),
        ),
      ),
    );
  }

  void goToHomePage() {
    final sharedPreferencesNotifier =
        GetIt.instance<SharedPreferencesNotifier>();

    sharedPreferencesNotifier.setValue(SharedPreferencesKeys.isOnBoarded, true);
    GoRouter.of(context).go(AppRoutes.login.path);
  }
}
