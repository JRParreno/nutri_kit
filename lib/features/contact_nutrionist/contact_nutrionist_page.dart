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
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        imageCard(Assets.images.contact.firstContact
                            .image(fit: BoxFit.cover)),
                        const SizedBox(width: 8),
                        Expanded(
                          child: detailCard(
                              address:
                                  'Clinical Dietitian Nutrition & Dietetics Section Bicol Regional Hospital & Medical Center Daraga,Albay',
                              contactNumber: '09940761264',
                              name: 'CECILE B. BELEN,RND'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        imageCard(Assets.images.contact.secondContact
                            .image(fit: BoxFit.cover)),
                        const SizedBox(width: 8),
                        Expanded(
                          child: detailCard(
                              address: 'City Health Office of Ligao City',
                              contactNumber: '0966684377',
                              name: 'Maria Elena P. Iglesia, RND'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
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
    return Container(
      width: 500, // Set a fixed width or let it adapt to the screen size
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: ColorName.secondary.withOpacity(0.8),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Name: $name',
            style: const TextStyle(color: ColorName.titleBg),
          ),
          const SizedBox(height: 10), // Space between texts
          Text(
            'Business Address: $address',
            style: const TextStyle(color: ColorName.titleBg),
            softWrap: true, // Ensure the text can wrap
          ),
          const SizedBox(height: 10), // Space between texts
          Text(
            'Mobile Number: $contactNumber',
            style: const TextStyle(color: ColorName.titleBg),
          ),
        ],
      ),
    );
  }
}
