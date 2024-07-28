import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nutri_kit/gen/assets.gen.dart';
import 'package:nutri_kit/main.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Assets.svgs.errorPage.lottie(),
          const Text(
            "Something went wrong,",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Text(
            "please try again.",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Gap(10),
          IntrinsicWidth(
            child: ElevatedButton(
              onPressed: () {
                router.pop();
              },
              child: const Text(
                'Go back',
                style: TextStyle(
                  fontFamily: 'Signika',
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
