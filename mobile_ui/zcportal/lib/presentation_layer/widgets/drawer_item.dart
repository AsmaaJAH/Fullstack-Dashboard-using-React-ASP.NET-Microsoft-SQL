import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:zcportal/constants/app_colors.dart';
import 'package:zcportal/presentation_layer/widgets/custom_localized_text_widget.dart';

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? imageURL;
  final Color? iconColor;
  final VoidCallback onTap;

  const DrawerItem({
    Key? key,
    this.icon = Icons.check_circle_outline,
    required this.title,
    required this.onTap,
    this.imageURL,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: AppColors.white,
      leading: imageURL != null
          ? SvgPicture.asset(
              imageURL!,
              width: 24, // Specify width and height
              height: 24,
              fit: BoxFit.contain,
            )
          : Icon(
              icon,
              color: iconColor ?? AppColors.gray,
            ),
      title: CustomLocalizedTextWidget(
        stringKey:  title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
    );
  }
}
