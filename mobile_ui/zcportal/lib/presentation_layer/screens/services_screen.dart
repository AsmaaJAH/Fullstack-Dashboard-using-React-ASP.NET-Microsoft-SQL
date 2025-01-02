import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:zcportal/constants/app_colors.dart';
import 'package:zcportal/constants/app_images_paths/app_images_assets.dart';
import 'package:zcportal/flavors_layer/delete_me.dart';
import 'package:zcportal/presentation_layer/screens/it_tickets_screens/it_tickets_screen.dart';
import 'package:zcportal/presentation_layer/widgets/inside_app_widgets/announcement_card.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({Key? key}) : super(key: key);
  void _onTap(context, {required Widget screen}) {
    PersistentNavBarNavigator.pushNewScreen(
      context,
      screen: screen,
      withNavBar: true, // OPTIONAL VALUE. True by default.
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnnouncementCard(
                imagePath: AppImagesAssets.attendance,
                title: 'View Attendance',
                onTap: () {
                  _onTap(context, screen: const DeleteMe());
                },
              ),
              AnnouncementCard(
                imagePath: AppImagesAssets.hiringRequests,
                title: 'Hiring Requests',
                onTap: () {
                  _onTap(context, screen: const DeleteMe());
                },
              ),
              AnnouncementCard(
                imagePath: AppImagesAssets.itTicket,
                title: 'IT Tickets',
                onTap: () {
                  _onTap(context, screen: const ItTicketsScreen());
                },
              ),
              AnnouncementCard(
                imagePath: AppImagesAssets.clearance,
                title: 'Clearance Request',
                onTap: () {
                  _onTap(context, screen: const DeleteMe());
                },
              ),
            ],
          ),
        ));
  }
}
