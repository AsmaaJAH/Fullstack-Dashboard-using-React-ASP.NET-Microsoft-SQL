import 'package:flutter/material.dart';
import 'package:zcportal/constants/app_colors.dart';
import 'package:zcportal/constants/app_enum.dart';
import 'package:zcportal/constants/app_images_paths/app_images_assets.dart';
import 'package:zcportal/constants/app_screen_dimensions.dart';
import 'package:zcportal/presentation_layer/widgets/custom_localized_text_widget.dart';
import 'package:zcportal/presentation_layer/widgets/inside_app_widgets/announcement_card.dart';
import 'package:zcportal/presentation_layer/widgets/inside_app_widgets/onboarding_card.dart';
import 'package:zcportal/presentation_layer/widgets/inside_app_widgets/section_header.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Announcements Section
            SectionHeader(
              title: 'Announcements',
              onAddPressed: () {
                // Handle add new announcement
              },
            ),
            const SizedBox(height: 8.0),
            AnnouncementCard(
              imagePath: AppImagesAssets.it,
              title: 'IT Announcement',
            ),
            const SizedBox(height: 16.0),

            // OnBoarding Internet Section
            SectionHeader(
              title: 'OnBoarding Internet',
              onAddPressed: () {
                // Handle add new onboarding
              },
            ),
            const SizedBox(height: 8.0),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OnboardingCard(
                  imagePath: AppImagesAssets.onboardingInternetCard,
                  title: 'Windows',
                ),
                OnboardingCard(
                  imagePath: AppImagesAssets.onboardingInternetCard,
                  title: 'Android',
                ),
              ],
            ),
            const SizedBox(height: 16.0),

            // FAQ Section
            const CustomLocalizedTextWidget(
              stringKey: 'For More Information:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),

            Center(
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: kScreenWidth * 0.3,
                  height: kScreenWidth * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(255, 7, 223, 252),
                        Color.fromARGB(255, 13, 67, 74)
                      ],
                    ),
                  ),
                  child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.table_chart_outlined,
                          color: AppColors.white,
                          size: 40,
                        ),
                        CustomLocalizedTextWidget(
                          stringKey: "FAQ",
                          color: AppColors.white,
                          fontSize: 20,
                          fontWeight: CustomTextWeight.boldFont,
                        )
                      ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
