import 'package:flutter/material.dart';
import 'package:zcportal/constants/app_colors.dart';
import 'package:zcportal/constants/app_enum.dart';
import 'package:zcportal/constants/variables.dart';
import 'package:zcportal/control_layer/functions/handle_logout.dart';
import 'package:zcportal/control_layer/functions/provider_helper_functions.dart';
import 'package:zcportal/presentation_layer/screens/login_screen.dart';
import 'package:zcportal/presentation_layer/widgets/custom_localized_text_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.white,
        title: const CustomLocalizedTextWidget(stringKey: 'Settings', fontSize: 20 ,fontWeight: CustomTextWeight.semiBoldFont,),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            ProviderHelperFunctions.readCurrentProviderState(
              currentOperation: Variables.persistTabViewProvider,
            );
            ProviderHelperFunctions.persistState.updateIsHidden(false);

            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB( 30, 16.0, 30, 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Account",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            _settingsItem(
              context,
              icon: Icons.person_2_outlined,
              title: 'Edit Profile',
              onTap: () {
                // Navigate to edit profile
              },
            ),
            _settingsItem(
              context,
              icon: Icons.privacy_tip_outlined,
              title: 'Terms and Policies',
              onTap: () {
                // Navigate to terms and policies
              },
            ),
            _settingsItem(
              context,
              icon: Icons.notifications_none,
              title: 'Notifications',
              onTap: () {
                // Navigate to notifications settings
              },
            ),
            _settingsItem(
              context,
              icon: Icons.lock_outline,
              title: 'Privacy',
              onTap: () {
                // Navigate to privacy settings
              },
            ),
            const SizedBox(height: 16),
            const Text(
              "Actions",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            _settingsItem(
              context,
              icon: Icons.flag_outlined,
              title: 'Report a Problem',
              onTap: () {
                // Navigate to report a problem
              },
            ),
            _settingsItem(
              context,
              icon: Icons.logout,
              title: 'Log out',
              onTap: handleLogout,
            ),
          ],
        ),
      ),
    );
  }

  Widget _settingsItem(BuildContext context,
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return ListTile(
      tileColor: AppColors.black.withOpacity(0.05),
      leading: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Icon(icon, color:AppColors.gray),
      ),
      title: CustomLocalizedTextWidget(stringKey: title, fontSize: 14 ,fontWeight: CustomTextWeight.regularFont,
      color: AppColors.black,),
      onTap: onTap,
    );
  }
}
