import 'package:flutter/material.dart';
import 'package:routiner/core/theme/app_colors.dart';
import 'package:routiner/core/theme/app_text_styles.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String avatarUrl;
  final int points;

  const ProfileHeader({
    Key? key,
    required this.name,
    required this.avatarUrl,
    required this.points,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(avatarUrl),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: AppTextStyles.h3,
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.orange10,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/images/bold_medal.png',
                          height: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '$points Points',
                          style: AppTextStyles.bodyLarge.copyWith(
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}