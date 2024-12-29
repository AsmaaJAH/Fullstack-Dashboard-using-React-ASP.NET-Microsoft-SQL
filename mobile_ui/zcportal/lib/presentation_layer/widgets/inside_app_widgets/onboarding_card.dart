import 'package:flutter/material.dart';
import 'package:zcportal/constants/app_colors.dart';
import 'package:zcportal/constants/app_enum.dart';
import 'package:zcportal/presentation_layer/widgets/custom_localized_text_widget.dart';

class OnboardingCard extends StatelessWidget {
  final String imagePath;
  final String title;

  const OnboardingCard({
    Key? key,
    required this.imagePath,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 3,
      child: SizedBox(
        width: 150,
        child: Column(
          children: [
            Image.asset(
              imagePath,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomLocalizedTextWidget(
                stringKey: title,
                color: AppColors.white,
                fontSize: 14,
                fontWeight: CustomTextWeight.boldFont,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
