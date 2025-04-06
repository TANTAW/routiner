class ActivityItem {
  final String title;
  final String date;
  final String time;
  final ActivityType type;
  final int points;

  ActivityItem({
    required this.title,
    required this.date,
    required this.time,
    required this.type,
    this.points = 0,
  });
}

enum ActivityType {
  pointsEarned,
  challengeCompleted,
  streakBroken,
}