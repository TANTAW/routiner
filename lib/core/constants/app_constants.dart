class AppConstants {
  // API endpoints
  static const String baseUrl = "https://api.routiner.app/v1";
  static const String authEndpoint = "/auth";
  static const String habitsEndpoint = "/habits";
  static const String challengesEndpoint = "/challenges";
  static const String usersEndpoint = "/users";
  
  // Local storage keys
  static const String tokenKey = "auth_token";
  static const String userIdKey = "user_id";
  static const String onboardingCompleteKey = "onboarding_complete";
  static const String themePreferenceKey = "theme_preference";
  
  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 50;
  
  // Timeouts
  static const int connectionTimeoutSeconds = 30;
  static const int receiveTimeoutSeconds = 30;
  
  // Animation durations
  static const int shortAnimationDuration = 200; // milliseconds
  static const int mediumAnimationDuration = 350; // milliseconds
  static const int longAnimationDuration = 500; // milliseconds
  
  // Feature flags
  static const bool enableSocialFeatures = true;
  static const bool enableChallenges = true;
  static const bool enableMoodTracking = true;
  static const bool enableLocationBasedHabits = true;
  
  // Habit constants
  static const int maxHabitsPerDay = 10;
  static const int maxRemindersPerHabit = 5;
  static const int defaultReminderMinutesBefore = 15;
  
  // Points system
  static const int pointsPerCompletedHabit = 10;
  static const int pointsPerCompletedChallenge = 50;
  static const int streakBonusMultiplier = 2; // Points multiplier for streaks
  static const int streakThreshold = 7; // Days needed for streak bonus
  
  // Cache durations
  static const int habitCacheDurationHours = 24;
  static const int userCacheDurationHours = 72;
  
  // Default values
  static const String defaultAvatarUrl = "assets/images/default_avatar.png";
  static const int defaultGoalCount = 1;
}