
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onAddPressed;

  const SectionHeader({
    Key? key,
    required this.title,
    required this.onAddPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          onTap: onAddPressed,
          child: const Text(
            '+ add new..',
            style: TextStyle(
              fontSize: 14,
              color: Colors.teal,
            ),
          ),
        ),
      ],
    );
  }
}
