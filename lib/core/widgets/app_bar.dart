import 'package:flutter/material.dart';
import 'package:routiner/core/theme/app_text_styles.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final VoidCallback onSettingsTap;

  const CustomAppBar({
    Key? key,
    required this.title,
    required this.onSettingsTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyles.h2,
          ),
          IconButton(
            icon: Icon(Icons.settings_outlined),
            onPressed: onSettingsTap,
          ),

        ],
      ),
    );
  }
}