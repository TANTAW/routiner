import 'package:flutter/material.dart';
import 'package:routiner/core/theme/app_text_styles.dart';
import 'package:routiner/domain/entities/friend.dart';

class FriendItemCard extends StatelessWidget {
  final Friend friend;
  final VoidCallback onRemoveTap;

  const FriendItemCard({
    Key? key,
    required this.friend,
    required this.onRemoveTap,
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
            CircleAvatar(
              backgroundImage: NetworkImage(friend.avatarUrl),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    friend.name,
                    style: AppTextStyles.bodyLarge.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${friend.points} Points',
                    style: AppTextStyles.bodySmall.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.person_remove_outlined),
              onPressed: onRemoveTap,
            ),
          ],
        ),
      ),
    );
  }
}