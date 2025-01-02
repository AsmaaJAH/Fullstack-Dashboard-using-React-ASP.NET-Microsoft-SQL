import 'package:flutter/material.dart';
import 'package:zcportal/constants/app_colors.dart';
import 'package:zcportal/constants/app_images_paths/app_images_assets.dart';
import 'package:zcportal/constants/app_screen_dimensions.dart';
import 'package:zcportal/presentation_layer/widgets/custom_localized_text_widget.dart';

class SingleAnnouncementScreen extends StatefulWidget {
  const SingleAnnouncementScreen({Key? key}) : super(key: key);

  @override
  State<SingleAnnouncementScreen> createState() =>
      _SingleAnnouncementScreenState();
}

class _SingleAnnouncementScreenState extends State<SingleAnnouncementScreen> {
  bool _isExpanded = false; // Tracks whether the full text is shown

  @override
  Widget build(BuildContext context) {
    const String longText =
        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
        "when an unknown printer took a galley of type and scrambled it to make a type specimen book. "
        "It has survived not only five centuries, but also the leap into electronic typesetting, "
        "remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets "
        "containing Lorem Ipsum passages.";

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Announcement Header Image
            Center(
              child: Image.asset(
                AppImagesAssets
                    .singleAnnouncement, // Replace with your image path
              ),
            ),
            const SizedBox(height: 16.0),

            // Announcement Title
            const CustomLocalizedTextWidget(
              stringKey: "Chaty: New Event At Summer",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Posted At Info
                    CustomLocalizedTextWidget(
                      stringKey: "Posted at:",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    CustomLocalizedTextWidget(
                      stringKey: "July 7th, 2024",
                      fontSize: 14,
                      color: AppColors.gray,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomLocalizedTextWidget(
                      stringKey: "Description",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8.0),

                    // Description with "Read More" / "Read Less"
                    SizedBox(
                      width: kScreenWidth * 0.6,
                      child: Wrap(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomLocalizedTextWidget(
                            stringKey: _isExpanded
                                ? longText
                                : "${longText.substring(0, 220)}...", // Truncate text
                            style: const TextStyle(fontSize: 14.0),
                            textAlign: TextAlign.justify,
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _isExpanded = !_isExpanded;
                              });
                            },
                            child: CustomLocalizedTextWidget(
                              stringKey:
                                  _isExpanded ? "Read Less" : "Read More",
                              style: const TextStyle(
                                color: AppColors.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16.0),

                    // Secondary Image
                    Center(
                      child: Image.asset(
                        AppImagesAssets.chaty, // Replace with your image path
                        width: kScreenWidth * 0.65,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
