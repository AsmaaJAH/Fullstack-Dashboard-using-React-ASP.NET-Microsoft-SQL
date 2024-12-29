import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:zcportal/constants/app_colors.dart';
import 'package:zcportal/constants/app_images_paths/app_images_assets.dart';
import 'package:zcportal/constants/app_screen_dimensions.dart';
import 'package:zcportal/constants/variables.dart';
import 'package:zcportal/control_layer/functions/handle_logout.dart';
import 'package:zcportal/control_layer/functions/provider_helper_functions.dart';
import 'package:zcportal/presentation_layer/screens/profile_screen.dart';
import 'package:zcportal/presentation_layer/screens/settings_screen.dart';
import 'package:zcportal/presentation_layer/widgets/drawer_item.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 17, 141, 158),
      child: Column(
        children: [
          Theme(
            data: Theme.of(context).copyWith(
              dividerTheme: const DividerThemeData(color: Colors.transparent),
            ),
            child: const DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Profile Picture
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(AppImagesAssets
                        .profileImage), // Replace with your asset path
                  ),
                  SizedBox(height: 10),
                  // Name and Role
                  Text(
                    'Asmaa Gamal Nagy',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Staff',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: kScreenHeight * 0.01,
          ),
          // Navigation Items
          Expanded(
            child: SizedBox(
              width: kScreenWidth * 0.7,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerItem(
                    icon: Icons.person,
                    title: 'Profile',
                    onTap: () {
                      // Handle Profile navigation
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: const  ProfileScreen(),
                        withNavBar: true,
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                    },
                  ),
                  DrawerItem(
                    icon: Icons.edit_square,
                    title: 'Leave Requests',
                    onTap: () {
                      // Handle Leave Requests navigation
                    },
                  ),
                  DrawerItem(
                    icon: Icons.campaign,
                    iconColor: AppColors.greenAcceptDialog,
                    title: 'Announcements',
                    //imageURL: AppImagesAssets.announcementIcon,
                    onTap: () {
                      // Handle Announcements navigation
                    },
                  ),
                  DrawerItem(
                    iconColor: AppColors.yellowInFlutter,
                    icon: Icons.access_time_filled,
                    //imageURL: AppImagesAssets.attendanceIcon,
                    title: 'Attendance',
                    onTap: () {
                      // Handle Attendance navigation
                    },
                  ),
                  DrawerItem(
                    icon: Icons.settings,
                    title: 'Settings',
                    onTap: () {
                      ProviderHelperFunctions.readCurrentProviderState(
                        currentOperation: Variables.persistTabViewProvider,
                      );
                      ProviderHelperFunctions.persistState.updateIsHidden(true);

                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: const  SettingsScreen(),
                        withNavBar: true,
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                    },
                  ),
                 const  DrawerItem(
                    icon: Icons.logout,
                    title: 'Log out',
                    onTap:handleLogout,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
