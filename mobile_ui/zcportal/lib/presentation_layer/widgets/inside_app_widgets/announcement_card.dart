import 'package:flutter/material.dart';
import 'package:zcportal/constants/app_colors.dart';

class AnnouncementCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final void Function()? onTap;

  const AnnouncementCard({
    Key? key,
    required this.imagePath,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: AppColors.white,
        elevation: 3,
        child: Column(
          children: [
            Image.asset(
              imagePath,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
