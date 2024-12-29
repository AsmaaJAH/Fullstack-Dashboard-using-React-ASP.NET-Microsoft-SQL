import 'package:flutter/material.dart';
import 'package:zcportal/presentation_layer/widgets/inside_app_widgets/onboarding_card.dart';

class SingleOnboardingRow extends StatelessWidget {
  final String imagePath1;
  final String title1;
  final String imagePath2;
  final String title2;
  const SingleOnboardingRow({
    Key? key,
    required this.imagePath1,
    required this.title1,
    required this.imagePath2,
    required this.title2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OnboardingCard(
          imagePath: imagePath1,
          title: title1,
        ),
        OnboardingCard(
          imagePath: imagePath2,
          title: title2,
        ),
      ],
    );
  }
}
