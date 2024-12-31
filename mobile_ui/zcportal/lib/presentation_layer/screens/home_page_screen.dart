import 'package:flutter/material.dart';
import 'package:zcportal/constants/app_enum.dart';
import 'package:zcportal/constants/app_images_paths/app_images_assets.dart';
import 'package:zcportal/presentation_layer/widgets/custom_localized_text_widget.dart';
import 'package:zcportal/presentation_layer/widgets/it_utilities_card.dart';
import 'package:zcportal/presentation_layer/widgets/slider_with_indicator.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15),
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
                      primary: false,
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    physics: const NeverScrollableScrollPhysics(),
                    children: const [
                      ItUtilitiesCard(
                        title: "Support Services",
                        subtitle: "Get IT support for any technical issue.",
                      ),
                       ItUtilitiesCard(
                        title: "Network Services",
                        subtitle: "Manage and monitor your IT network.",
                      ),
                       ItUtilitiesCard(
                        title: "Self-Service",
                        subtitle: "Academic support & Google classroom services.",
                      ),
                       ItUtilitiesCard(
                        title: "Light-Current Services",
                        subtitle: "Install and manage hardware solutions.",
                      ),
                       ItUtilitiesCard(
                        title: "System Administration Services",
                        subtitle: "Reach the admin to monitor and manage systems.",
                      ),
                       ItUtilitiesCard(
                        title: "Administration Office Services",
                        subtitle: "Get in touch with your IT coordinators.",
                      ),
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
}
