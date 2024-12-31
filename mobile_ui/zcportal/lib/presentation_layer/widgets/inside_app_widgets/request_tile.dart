
import 'package:flutter/material.dart';
import 'package:zcportal/constants/app_enum.dart';
import 'package:zcportal/presentation_layer/widgets/custom_localized_text_widget.dart';

class RequestTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const RequestTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
      ),
      title: CustomLocalizedTextWidget(
        stringKey:  title,
        fontWeight: CustomTextWeight.boldFont,
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.grey,
      ),
      onTap: onTap,
    );
  }
}
