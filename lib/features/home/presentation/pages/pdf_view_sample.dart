import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:nutri_kit/features/home/presentation/pages/pinggang_pinoy_pdf_viewer_page.dart';
import 'package:nutri_kit/gen/colors.gen.dart';

class PdfViewSample extends StatefulWidget {
  const PdfViewSample({
    super.key,
    required this.pdfParams,
  });

  final PDFParams pdfParams;

  @override
  State<PdfViewSample> createState() => _PdfViewSampleState();
}

class _PdfViewSampleState extends State<PdfViewSample> {
  int page = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.primary,
      appBar: AppBar(
        title: Text(widget.pdfParams.title),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              '$page/2',
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: PDF(
        fitEachPage: true,
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: false,
        pageFling: false,
        onPageChanged: (value, total) {
          setState(() {
            page = value != null && value > 0 ? value : 1;
          });
        },
      ).fromAsset(
        widget.pdfParams.assetPath,
        loadingWidget: () => const CircularProgressIndicator(
          color: ColorName.primary,
        ),
      ),
    );
  }
}
