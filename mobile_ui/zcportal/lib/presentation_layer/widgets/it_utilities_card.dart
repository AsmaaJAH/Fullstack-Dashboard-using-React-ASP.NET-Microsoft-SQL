import 'package:flutter/material.dart';
import 'package:zcportal/constants/app_colors.dart';
import 'package:zcportal/constants/app_enum.dart';
import 'package:zcportal/constants/app_images_paths/app_images_assets.dart';
import 'package:zcportal/constants/app_screen_dimensions.dart';
import 'package:zcportal/presentation_layer/widgets/custom_localized_text_widget.dart';

class ItUtilitiesCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const ItUtilitiesCard({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      child: Stack(
        children: [
          // Background Image
          Image.asset(
            AppImagesAssets.cardBackground,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          // Title and Subtitle
          Positioned(
            top: 20, 
            left: 20, 
            right: 20,
            child: CustomLocalizedTextWidget(
              stringKey: title,
              color: AppColors.white,
              fontSize: 16,
              fontWeight: CustomTextWeight.boldFont,
            ),
          ),
          Positioned(
            top: kScreenWidth * 0.25, 
            left: 10,
            right: 10, 
            child: CustomLocalizedTextWidget(
              stringKey: subtitle,
              color: AppColors.white,
              fontWeight: CustomTextWeight.regularFont,
            ),
          ),
        ],
      ),
    );
  }
}
