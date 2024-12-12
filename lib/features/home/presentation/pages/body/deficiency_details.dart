// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:gap/gap.dart';
import 'package:nutri_kit/gen/assets.gen.dart';

import 'package:nutri_kit/gen/colors.gen.dart';

class DeficiencyDetails extends StatelessWidget {
  const DeficiencyDetails({
    super.key,
    required this.healthStatus,
  });

  final String healthStatus;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(18),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 55),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: ColorName.secondary,
            ),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 120),
                  child: titleText(),
                ),
                const Gap(18),
                descriptionText(healthStatus),
                const Gap(18),
                const Text('What Causes It: '),
                const Gap(10),
                buildDescriptions(healthStatus),
              ],
            ),
          ),
          Positioned(
            left: 18,
            child: imageHealth(healthStatus),
          ),
        ],
      ),
    );
  }

  Widget titleText() {
    String text = '';
    switch (healthStatus) {
      case 'UNDERWEIGHT':
        text = 'Underweight (Low Weight-for-Height)';
        break;
      case 'STUNTED':
        text = 'Stunting (Low Height-for-Age)';
        break;
      case 'WAISTED':
        text = 'Wasted';
        break;
      case 'OVERWEIGHT':
        text = 'Overweight';
        break;
      default:
        text = 'Obesity';
        break;
    }
    return Text(
      text,
      style: const TextStyle(
        color: ColorName.miniCardBg,
        fontSize: 18,
        letterSpacing: 0.24,
      ),
    );
  }

  Widget buildTitleDescription(
      {required String title, required String description}) {
    return RichText(
      text: TextSpan(
        text: "• $title",
        style: const TextStyle(
          fontSize: 17,
          color: Color(0xFF0C644A),
        ),
        children: [
          TextSpan(
            text: description,
            style: const TextStyle(
              color: ColorName.miniCardBg,
              fontSize: 17,
            ),
          )
        ],
      ),
    );
  }

  Widget buildDescriptions(String healthStatus) {
    return Column(
      children: listOfTitles()
          .mapWithIndex(
            (t, index) => Column(
              children: [
                buildTitleDescription(
                    title: listOfTitles()[index],
                    description: listOfDescriptions()[index]),
                const SizedBox(height: 10)
              ],
            ),
          )
          .toList(),
    );
  }

  Widget imageHealth(String healthStatus) {
    switch (healthStatus) {
      case 'UNDERWEIGHT':
        return baseImage(Assets.images.meal.underweight.image());
      case 'STUNTED':
        return baseImage(Assets.images.meal.stunted.image());
      case 'WAISTED':
        return baseImage(Assets.images.meal.waisted.image());
      case 'OVERWEIGHT':
        return baseImage(Assets.images.meal.overweight.image());
      default:
        return baseImage(Assets.images.meal.obese.image());
    }
  }

  Widget baseImage(Image image) {
    return Container(
      width: 108,
      height: 108,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: ColorName.card,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: image,
      ),
    );
  }

  Widget descriptionText(String healthStatus) {
    const fontSize = 17.0;
    switch (healthStatus) {
      case 'UNDERWEIGHT':
        return const Text(
            style: TextStyle(
              fontSize: fontSize,
              color: ColorName.miniCardBg,
            ),
            "Underweight refers to a condition where an individual, especially a child, has low weight for their age. This can be a result of both acute and chronic malnutrition, signifying that the body isn't receiving the necessary nutrients to support healthy growth and development. Underweight can be a combination of both wasting (acute malnutrition) and stunting (chronic malnutrition).");
      case 'STUNTED':
        return const Text(
            style: TextStyle(
              fontSize: fontSize,
              color: ColorName.miniCardBg,
            ),
            "Stunting refers to a condition where a child is shorter than expected for their age, indicating chronic malnutrition. This form of undernutrition typically results from long-term insufficient nutrient intake and recurrent illness, particularly during critical periods of growth in early childhood.");

      case 'WAISTED':
        return const Text(
            style: TextStyle(
              fontSize: fontSize,
              color: ColorName.miniCardBg,
            ),
            "Wasting refers to a condition in which an individual, particularly a child, has low weight relative to their height. It indicates acute malnutrition, often resulting from recent, severe weight loss. Wasting suggests that the body is not receiving enough nutrients to sustain normal bodily functions and growth.");
      case 'OVERWEIGHT':
        return const Text(
            style: TextStyle(
              fontSize: fontSize,
              color: ColorName.miniCardBg,
            ),
            "Overweight is defined as having more body weight than is considered healthy for a given height. A person is classified as overweight when their Body Mass Index (BMI) is between 25 and 29.9. This condition typically results from an imbalance between calories consumed and calories expended through physical activity.");
      default:
        return const Text(
            style: TextStyle(
              fontSize: fontSize,
              color: ColorName.miniCardBg,
            ),
            "Obesity is a more severe form of being overweight, characterized by excessive body fat accumulation that poses significant health risks. It is typically defined as having a BMI of 30 or higher. Obesity is associated with a higher risk of chronic diseases, including diabetes, heart disease, and certain cancers.");
    }
  }

  List<String> listOfDescriptions() {
    switch (healthStatus) {
      case 'UNDERWEIGHT':
        return [
          "Consuming insufficient calories or nutrients over time can lead to low body weight for age.",
          "Frequent illnesses, such as diarrhea or respiratory infections, can impair the body’s ability to absorb nutrients and maintain a healthy weight.",
          "Poverty, food insecurity, and lack of access to healthcare can contribute to persistent undernutrition and underweight.",
          "Poor maternal nutrition during pregnancy and breastfeeding can affect an infant’s growth and weight gain.",
        ];
      case 'STUNTED':
        return [
          "Prolonged lack of essential nutrients, such as vitamins, minerals, and proteins, prevents normal growth and development.",
          "Repeated illnesses, especially in young children, can hinder the body's ability to absorb nutrients effectively.",
          "Poor maternal nutrition during pregnancy can affect fetal growth, leading to stunting after birth.",
        ];
      case 'WAISTED':
        return [
          "A sudden lack of access to sufficient food can cause rapid weight loss.",
          "Illnesses such as diarrhea, pneumonia, or malaria can lead to wasting by impairing the body's ability to absorb or utilize nutrients.",
          "Contaminated water and poor hygiene can contribute to illness, worsening the effects of malnutrition.",
        ];
      case 'OVERWEIGHT':
        return [
          "Consuming more calories than the body needs, particularly from high-fat and sugary foods, leads to weight gain.",
          "Sedentary lifestyles, with minimal physical exercise, result in reduced calorie expenditure and weight gain.",
          "Some individuals have a genetic predisposition to gaining weight more easily.",
          "Living in environments where unhealthy foods are more accessible and opportunities for physical activity are limited can contribute to being overweight.",
        ];

      default:
        return [
          "Diets high in processed foods, sugar, and fats are major contributors to obesity.",
          "Lack of regular physical exercise results in excess fat storage in the body.",
          "Genetics can influence how a person's body stores fat and processes calories, making some individuals more susceptible to obesity.",
          "Conditions such as hypothyroidism and polycystic ovary syndrome (PCOS), as well as certain medications like antidepressants, can contribute to weight gain.",
          "Emotional stress, anxiety, and depression can lead to overeating, particularly of high-calorie comfort foods."
        ];
    }
  }

  List<String> listOfTitles() {
    switch (healthStatus) {
      case 'UNDERWEIGHT':
        return [
          "Inadequate food intake: ",
          "Recurrent infections: ",
          "Socioeconomic factors: ",
          "Maternal malnutrition: "
        ];
      case 'STUNTED':
        return [
          "Chronic malnutrition: ",
          "Frequent infections: ",
          "Maternal malnutrition: ",
        ];
      case 'WAISTED':
        return [
          "Acute food shortage: ",
          "Infections: ",
          "Poor sanitation and water access: ",
        ];
      case 'OVERWEIGHT':
        return [
          "Excess calorie intake: ",
          "Lack of physical activity: ",
          "Genetics: ",
          "Environmental factors: ",
        ];

      default:
        return [
          "Unhealthy diet: ",
          "Physical inactivity: ",
          "Genetic factors: ",
          "Medical conditions and medications: ",
          "Psychological factors: ",
        ];
    }
  }
}
