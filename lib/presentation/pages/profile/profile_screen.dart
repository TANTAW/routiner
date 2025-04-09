import 'package:flutter/material.dart';
import 'package:routiner/core/widgets/achievement_card.dart';
import 'package:routiner/core/widgets/activity_item_card.dart';
import 'package:routiner/core/widgets/app_bar.dart';
import 'package:routiner/core/widgets/friend_item_card.dart';
import 'package:routiner/core/widgets/profile_header.dart';
import 'package:routiner/core/widgets/tab_selector.dart';
import 'package:routiner/domain/entities/achievement.dart';
import 'package:routiner/domain/entities/activity_item.dart';
import 'package:routiner/domain/entities/friend.dart';
import 'package:routiner/presentation/pages/settings/settings_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedTabIndex = 0;
  final List<String> _tabs = ['Activity', 'Friends', 'Achievements'];

  // Mock data - in a real app, this would come from a repository
  final List<ActivityItem> _activityItems = [
    ActivityItem(
      title: '112 points earned!',
      date: 'Today',
      time: '12:34 PM',
      type: ActivityType.pointsEarned,
      points: 112,
    ),
    ActivityItem(
      title: '62 points earned!',
      date: 'Today',
      time: '07:12 AM',
      type: ActivityType.pointsEarned,
      points: 62,
    ),
    ActivityItem(
      title: 'Challenge completed!',
      date: 'Yesterday',
      time: '14:12 PM',
      type: ActivityType.challengeCompleted,
    ),
    ActivityItem(
      title: 'Weekly winning streak is broken!',
      date: '12 Jun',
      time: '16:14 PM',
      type: ActivityType.streakBroken,
    ),
    ActivityItem(
      title: '96 points earned!',
      date: '11 Jun',
      time: '17:45 PM',
      type: ActivityType.pointsEarned,
      points: 96,
    ),
    ActivityItem(
      title: '110 points earned!',
      date: '10 Jun',
      time: '18:32 PM',
      type: ActivityType.pointsEarned,
      points: 110,
    ),
  ];

  final List<Friend> _friends = [
    Friend(
      id: '1',
      name: 'Sharie Bento',
      avatarUrl: 'https://randomuser.me/api/portraits/women/1.jpg',
      points: 912,
    ),
    Friend(
      id: '2',
      name: 'Micah Dantoni',
      avatarUrl: 'https://randomuser.me/api/portraits/men/2.jpg',
      points: 912,
    ),
    Friend(
      id: '3',
      name: 'Oral Padlo',
      avatarUrl: 'https://randomuser.me/api/portraits/men/3.jpg',
      points: 912,
    ),
    Friend(
      id: '4',
      name: 'Regina Stire',
      avatarUrl: 'https://randomuser.me/api/portraits/women/4.jpg',
      points: 912,
    ),
    Friend(
      id: '5',
      name: 'Maressa Mcdiarmid',
      avatarUrl: 'https://randomuser.me/api/portraits/women/5.jpg',
      points: 912,
    ),
    Friend(
      id: '6',
      name: 'Jennings Stohler',
      avatarUrl: 'https://randomuser.me/api/portraits/men/6.jpg',
      points: 912,
    ),
  ];

  final List<Achievement> _achievements = [
    Achievement(
      id: '1',
      title: 'Best Runner!',
      timeAgo: '1 months ago',
      iconPath: 'assets/images/runner.png',
    ),
    Achievement(
      id: '2',
      title: 'Best of the month!',
      timeAgo: '2 days ago',
      iconPath: 'assets/images/best.png',
    ),
  ];

  void _onTabSelected(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  void _onSettingsTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SettingsScreen(),
      ),
    );
  }

  void _onRemoveFriend(String friendId) {
    // Remove friend logic
    setState(() {
      _friends.removeWhere((friend) => friend.id == friendId);
    });
  }

  void _onAddFriend() {
    // Add friend logic
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(title: 'Your Profile', onSettingsTap: _onSettingsTap),
            ProfileHeader(
              name: 'Mert Kahveci',
              avatarUrl: 'https://randomuser.me/api/portraits/men/32.jpg',
              points: 1452,
            ),
            TabSelector(
              tabs: _tabs,
              selectedIndex: _selectedTabIndex,
              onTabSelected: _onTabSelected,
            ),
            Expanded(
              child: _buildSelectedTabContent(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
        currentIndex: 4, // Profile tab
        selectedItemColor: Colors.blue,
      ),
    );
  }

  Widget _buildSelectedTabContent() {
    switch (_selectedTabIndex) {
      case 0:
        return _buildActivityTab();
      case 1:
        return _buildFriendsTab();
      case 2:
        return _buildAchievementsTab();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildActivityTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Showing last month activity',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {},
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _activityItems.length,
            itemBuilder: (context, index) {
              return ActivityItemCard(item: _activityItems[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFriendsTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${_friends.length} Friends',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.person_add_outlined),
                    onPressed: _onAddFriend,
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit_outlined),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _friends.length,
            itemBuilder: (context, index) {
              return FriendItemCard(
                friend: _friends[index],
                onRemoveTap: () => _onRemoveFriend(_friends[index].id),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildAchievementsTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            '${_achievements.length} Achievements',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _achievements.length,
            itemBuilder: (context, index) {
              return AchievementCard(achievement: _achievements[index]);
            },
          ),
        ),
      ],
    );
  }
}
