import 'package:flutter/material.dart';
import 'package:zcportal/constants/app_enum.dart';
import 'package:zcportal/constants/app_images_paths/app_images_assets.dart';
import 'package:zcportal/presentation_layer/widgets/custom_localized_text_widget.dart';
import 'package:zcportal/presentation_layer/widgets/customized_appbar.dart';
import 'package:zcportal/presentation_layer/widgets/slider_with_indicator.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomizedAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
                        const SizedBox(height: 10),

            const SliderWithIndicator(mediaItems: [
              AppImagesAssets.zewail,
              AppImagesAssets.cyanLogo,
              AppImagesAssets.it,
              AppImagesAssets.whiteLogo,
            ]),

            const SizedBox(height: 10),
            // IT Utilities Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomLocalizedTextWidget(
                    stringKey: 'IT Utilities:',
                    fontSize: 20,
                    fontWeight: CustomTextWeight.boldFont,
                  ),
                  const SizedBox(height: 10),
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _buildUtilityCard('Support Services'),
                      _buildUtilityCard('Network Services'),
                      _buildUtilityCard('Self-Service'),
                      _buildUtilityCard('Light-Current'),
                      _buildUtilityCard('System Administration'),
                      _buildUtilityCard('Administration Office'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUtilityCard(String title) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: const Color(0xFF009ab5),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
