import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:nutri_kit/features/home/presentation/pages/pinggang_pinoy_pdf_viewer_page.dart';
import 'package:nutri_kit/features/home/presentation/widgets/index.dart';
import 'package:nutri_kit/gen/assets.gen.dart';
import 'package:nutri_kit/router/index.dart';

class PinggangPinoy extends StatelessWidget {
  const PinggangPinoy({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(10),
        Wrap(
          alignment: WrapAlignment.spaceBetween,
          spacing: 32,
          runSpacing: 32,
          children: [
            HomeCardWidget(
              image: Assets.images.home.homeKids.image(),
              onTap: () => handleOnTap(
                title: 'Kids',
                context: context,
                path: Assets.pdfs.homeKids,
              ),
            ),
            HomeCardWidget(
              image: Assets.images.home.homeTeens.image(),
              onTap: () => handleOnTap(
                title: 'Teens',
                context: context,
                path: Assets.pdfs.homeTeens,
              ),
            ),
            HomeCardWidget(
              image: Assets.images.home.homeAdults.image(),
              onTap: () => handleOnTap(
                title: 'Adults',
                context: context,
                path: Assets.pdfs.homeAdults,
              ),
            ),
            HomeCardWidget(
              image: Assets.images.home.homeOlderPersons.image(),
              onTap: () => handleOnTap(
                title: 'Older Persons',
                context: context,
                path: Assets.pdfs.homeOlderPersons,
              ),
            ),
          ],
        )
      ],
    );
  }

  void handleOnTap({
    required String path,
    required String title,
    required BuildContext context,
  }) {
    context.pushNamed(AppRoutes.homePDFViewer.name,
        extra: PDFParams(title: title, assetPath: path));
  }
}
