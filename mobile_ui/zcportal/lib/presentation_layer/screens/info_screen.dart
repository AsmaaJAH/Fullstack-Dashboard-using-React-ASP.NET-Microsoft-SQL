import 'package:flutter/material.dart';
import 'package:zcportal/constants/app_colors.dart';
import 'package:zcportal/constants/app_enum.dart';
import 'package:zcportal/constants/app_images_paths/app_images_assets.dart';
import 'package:zcportal/constants/app_screen_dimensions.dart';
import 'package:zcportal/presentation_layer/widgets/custom_localized_text_widget.dart';
import 'package:zcportal/presentation_layer/widgets/inside_app_widgets/announcement_card.dart';
import 'package:zcportal/presentation_layer/widgets/inside_app_widgets/section_header.dart';
import 'package:zcportal/presentation_layer/widgets/inside_app_widgets/single_onboarding_row.dart';
import 'package:zcportal/presentation_layer/widgets/slider_with_indicator.dart';

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
            const SliderWithIndicator(
              items: [
                AnnouncementCard(
                  imagePath: AppImagesAssets.itSupport,
                  title: 'IT Announcement',
                ),
                AnnouncementCard(
                  imagePath: AppImagesAssets.it,
                  title: 'IT Event',
                ),
                AnnouncementCard(
                  imagePath: AppImagesAssets.zewail,
                  title: 'HR Bazaar',
                ),
                AnnouncementCard(
                  imagePath: AppImagesAssets.cyanLogo,
                  title: 'Quick Announcement',
                ),
              ],
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
            const SliderWithIndicator(
              isSmallCard: true,
              items:[
                SingleOnboardingRow(
                  imagePath1: AppImagesAssets.onboardingInternetCard,
                  title1: 'Windows',
                  imagePath2: AppImagesAssets.onboardingInternetCard,
                  title2: 'Android',
                ),
                SingleOnboardingRow(
                  imagePath1: AppImagesAssets.onboardingInternetCard,
                  title1: 'Mac',
                  imagePath2: AppImagesAssets.onboardingInternetCard,
                  title2: 'iPhone',
                ),
                SingleOnboardingRow(
                  imagePath1: AppImagesAssets.onboardingInternetCard,
                  title1: 'Troubleshooting',
                  imagePath2: AppImagesAssets.onboardingInternetCard,
                  title2: 'Others'
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
