import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:zcportal/constants/app_colors.dart';
import 'package:zcportal/constants/app_images_paths/app_images_assets.dart';
import 'package:zcportal/presentation_layer/screens/requests%20forms/hr_letter_screen.dart';
import 'package:zcportal/presentation_layer/screens/requests%20forms/resignation_screen.dart';
import 'package:zcportal/presentation_layer/widgets/custom_localized_text_widget.dart';
import 'package:zcportal/presentation_layer/widgets/inside_app_widgets/request_tile.dart';

class HRRequestsScreen extends StatelessWidget {
  const HRRequestsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              AppImagesAssets.hr,
            ),
            const SizedBox(height: 16.0),

            const Center(
              child: CustomLocalizedTextWidget(
                stringKey: 'REQUESTS',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8.0),

            // HR Request Items
            RequestTile(
              icon: Icons.edit_square,
              title: 'Leave Request',
              onTap: () {
                // Handle Leave Request action
              },
            ),
            RequestTile(
              icon: Icons.mobile_friendly,
              title: 'Resignation',
              onTap: () {
                // Handle Resignation action
                 PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: const ResignationScreen(),
                  withNavBar: true, // OPTIONAL VALUE. True by default.
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              },
            ),
            RequestTile(
              icon: Icons.layers_outlined,
              title: 'HR Letter',
              onTap: () {
                // Handle HR Letter action
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: const HRLetterScreen(),
                  withNavBar: true, // OPTIONAL VALUE. True by default.
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
