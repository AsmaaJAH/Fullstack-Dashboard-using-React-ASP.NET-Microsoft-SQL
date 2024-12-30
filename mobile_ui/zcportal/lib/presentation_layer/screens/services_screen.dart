import 'package:flutter/material.dart';
import 'package:zcportal/constants/app_colors.dart';
import 'package:zcportal/constants/app_images_paths/app_images_assets.dart';
import 'package:zcportal/presentation_layer/widgets/inside_app_widgets/announcement_card.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        padding:  EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

                AnnouncementCard(
                  imagePath: AppImagesAssets.attendance,
                  title: 'View Attendance',
                ),
                AnnouncementCard(
                  imagePath: AppImagesAssets.hiringRequests,
                  title: 'Hiring Requests',
                ),
                AnnouncementCard(
                  imagePath: AppImagesAssets.itTicket,
                  title: 'IT Tickets',
                ),
                AnnouncementCard(
                  imagePath: AppImagesAssets.clearance,
                  title: 'Clearance Request',
                ),
              ],
          ),
          )
        );
  }
}
            