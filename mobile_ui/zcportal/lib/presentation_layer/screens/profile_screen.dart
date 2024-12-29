import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:zcportal/constants/app_colors.dart';
import 'package:zcportal/constants/app_enum.dart';
import 'package:zcportal/constants/app_images_paths/app_images_assets.dart';
import 'package:zcportal/constants/app_screen_dimensions.dart';
import 'package:zcportal/control_layer/functions/handle_logout.dart';
import 'package:zcportal/presentation_layer/screens/password_screen.dart';
import 'package:zcportal/presentation_layer/widgets/custom_localized_text_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: const CustomLocalizedTextWidget(
          stringKey: 'Profile',
          fontSize: 20,
          fontWeight: CustomTextWeight.boldFont,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: kScreenWidth * 0.2,
                backgroundImage: const AssetImage(AppImagesAssets
                    .profileImage), // Replace with your image asset path
              ),
            ),
            const SizedBox(height: 16),
            const Center(
              child: CustomLocalizedTextWidget(
                stringKey: 'Asmaa Gamal Nagy',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Center(
              child: CustomLocalizedTextWidget(
                stringKey: 'Staff',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.black,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
              child: CustomLocalizedTextWidget(
                stringKey: 'Welcome Back!',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.black,
                ),
              ),
            ),
            _profileItem(
              icon: Icons.lock,
              title: 'Password',
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 15,
              ),
              onTap: () {
                // Navigate to password settings
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: const PasswordScreen(),
                  withNavBar: true, // OPTIONAL VALUE. True by default.
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              },
            ),
            _profileItem(
              icon: Icons.mail,
              title: "Mail",
              trailing: const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: CustomLocalizedTextWidget(
                  stringKey: 'asmaanagy@zewailcity.edu.eg',
                  fontSize: 12,
                  fontWeight: CustomTextWeight.boldFont,
                ),
              ),
            ),
            _profileItem(
              icon: Icons.logout,
              title: 'Log out',
              onTap: handleLogout,
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileItem(
      {required IconData icon,
      required String title,
      Widget? trailing,
      VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: AppColors.black),
      title: CustomLocalizedTextWidget(
        stringKey: title,
        fontWeight: CustomTextWeight.boldFont,
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
