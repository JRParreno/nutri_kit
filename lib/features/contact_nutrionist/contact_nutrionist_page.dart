import 'package:flutter/material.dart';
import 'package:nutri_kit/gen/assets.gen.dart';
import 'package:nutri_kit/gen/colors.gen.dart';

class ContactNutrionistPage extends StatefulWidget {
  const ContactNutrionistPage({super.key});

  @override
  State<ContactNutrionistPage> createState() => _ContactNutrionistPageState();
}

class _ContactNutrionistPageState extends State<ContactNutrionistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contact Us',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorName.titleBg.withOpacity(0.65),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(21),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 125,
                    child: Row(
                      children: [
                        imageCard(Assets.images.contact.firstContact
                            .image(fit: BoxFit.cover)),
                        const SizedBox(width: 8),
                        detailCard(address: '', contactNumber: '', name: ''),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    height: 125,
                    width: double.infinity,
                    child: Row(
                      children: [
                        imageCard(Assets.images.contact.secondContact
                            .image(fit: BoxFit.cover)),
                        const SizedBox(width: 8),
                        detailCard(address: '', contactNumber: '', name: ''),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    height: 125,
                    width: double.infinity,
                    child: Row(
                      children: [
                        imageCard(Assets.images.contact.thirdContact
                            .image(fit: BoxFit.cover)),
                        const SizedBox(width: 8),
                        detailCard(address: '', contactNumber: '', name: ''),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    height: 125,
                    width: double.infinity,
                    child: Row(
                      children: [
                        imageCard(Assets.images.contact.fourthContact
                            .image(fit: BoxFit.cover)),
                        const SizedBox(width: 8),
                        detailCard(address: '', contactNumber: '', name: ''),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget imageCard(Widget image) {
    return Container(
      height: 125,
      width: 125,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: image,
    );
  }

  Widget detailCard({
    required String name,
    required String address,
    required String contactNumber,
  }) {
    return Expanded(
      child: Container(
        height: 125,
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
          color: ColorName.secondary.withOpacity(0.8),
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                'Name: ______________',
                maxLines: 1,
                style: TextStyle(color: ColorName.titleBg),
              ),
            ),
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                'Business Address: ______',
                maxLines: 1,
                style: TextStyle(color: ColorName.titleBg),
              ),
            ),
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                'Mobile Number: _________',
                maxLines: 1,
                style: TextStyle(color: ColorName.titleBg),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
