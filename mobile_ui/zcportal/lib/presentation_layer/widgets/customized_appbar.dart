//-------------------------- Flutter Packages Imports ----------------------------------

import 'package:flutter/material.dart';
import 'package:zcportal/constants/app_colors.dart';
import 'package:zcportal/constants/app_enum.dart';
import 'package:zcportal/constants/app_screen_dimensions.dart';
import 'package:zcportal/presentation_layer/widgets/custom_localized_text_widget.dart';

class CustomizedAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomizedAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: Colors.white,
          size: kScreenWidth * 0.08,
        ),
        onPressed: () {
          // menu and drawer
          Scaffold.of(context).openDrawer();

        },
      ),
      title: const CustomLocalizedTextWidget(
        stringKey: 'Welcome To ZC Portal',
        color: AppColors.white,
        fontWeight: CustomTextWeight.boldFont,
        fontSize: 17,
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Badge(
            backgroundColor: AppColors.white,
            //label: Text('1'),
            //textColor: AppColors.primary,
            child: Icon(
              Icons.notifications_none,
              color: Colors.white,
            ),
          ),
          onPressed: () {
            // Add notification button action here
          },
        ),
        IconButton(
          icon: const Icon(Icons.search, color: Colors.white),
          onPressed: () {
            // Add search button action here
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
