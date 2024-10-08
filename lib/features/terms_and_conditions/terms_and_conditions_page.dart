import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:nutri_kit/gen/assets.gen.dart';
import 'package:nutri_kit/gen/colors.gen.dart';

class TermsAndConditionsPage extends StatefulWidget {
  const TermsAndConditionsPage({super.key});

  @override
  State<TermsAndConditionsPage> createState() => _TermsAndConditionsPageState();
}

class _TermsAndConditionsPageState extends State<TermsAndConditionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Terms & Privacy Policy',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: PDF(
        fitEachPage: false,
        enableSwipe: true,
        swipeHorizontal: false,
        autoSpacing: false,
        pageFling: false,
        onPageChanged: (value, total) {},
      ).fromAsset(
        Assets.pdfs.nutriKitTermsConditions,
        loadingWidget: () => const CircularProgressIndicator(
          color: ColorName.primary,
        ),
      ),
    );
  }
}
