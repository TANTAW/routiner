import 'package:flutter/material.dart';
import 'package:routiner/core/theme/app_text_styles.dart';
import 'package:routiner/domain/entities/activity_item.dart';

class ActivityItemCard extends StatelessWidget {
  final ActivityItem item;

  const ActivityItemCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: AppTextStyles.bodyLarge.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${item.date}, ${item.time}',
                    style: AppTextStyles.bodySmall.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            _buildIcon(item.type),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(ActivityType type) {
    switch (type) {
      case ActivityType.pointsEarned:
        return const Icon(
          Icons.arrow_upward,
          color: Colors.green,
        );
      case ActivityType.challengeCompleted:
        return const Icon(
          Icons.emoji_events,
          color: Colors.amber,
        );
      case ActivityType.streakBroken:
        return const Icon(
          Icons.arrow_downward,
          color: Colors.red,
        );
    }
  }
}