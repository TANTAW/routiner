import 'package:flutter/material.dart';
import 'package:routiner/core/theme/app_colors.dart';
import 'package:routiner/core/widgets/primary_button.dart';
import 'package:routiner/core/widgets/selectable_card.dart';
import 'package:routiner/presentation/pages/home/home_screen.dart';

class HabitSelectionScreen extends StatefulWidget {
  final String name;
  final String surname;
  final String birthdate;
  final String gender;

  const HabitSelectionScreen({
    Key? key,
    required this.name,
    required this.surname,
    required this.birthdate,
    required this.gender,
  }) : super(key: key);

  @override
  State<HabitSelectionScreen> createState() => _HabitSelectionScreenState();
}

class _HabitSelectionScreenState extends State<HabitSelectionScreen> {
  final Set<String> _selectedHabits = {};

  final List<Map<String, dynamic>> _habits = [
    {
      'title': 'Drink water',
      'icon': 'assets/images/water.png',
    },
    {
      'title': 'Run',
      'icon': 'assets/images/run.png',
    },
    {
      'title': 'Read books',
      'icon': 'assets/images/book.png',
    },
    {
      'title': 'Meditate',
      'icon': 'assets/images/meditate.png',
    },
    {
      'title': 'Study',
      'icon': 'assets/images/study.png',
    },
    {
      'title': 'Journal',
      'icon': 'assets/images/journal.png',
    },
    {
      'title': 'Plant',
      'icon': 'assets/images/plant.png',
    },
    {
      'title': 'Sleep well',
      'icon': 'assets/images/sleep.png',
    },
  ];

  void _toggleHabit(String title) {
    setState(() {
      if (_selectedHabits.contains(title)) {
        _selectedHabits.remove(title);
      } else {
        _selectedHabits.add(title);
      }
    });
  }

  void _completeRegistration() {
    // Here you would typically save the user data and selected habits
    // For now, we'll just navigate to the dashboard
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const HomeScreen()),
          (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.textPrimary,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Choose your first habits',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'You may add more habits later',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.1,
                  ),
                  itemCount: _habits.length,
                  itemBuilder: (context, index) {
                    final habit = _habits[index];
                    final isSelected = _selectedHabits.contains(habit['title']);

                    return SelectableCard(
                      title: habit['title'],
                      icon: Image.asset(
                        habit['icon'],
                        height: 48,
                      ),
                      isSelected: isSelected,
                      onTap: () => _toggleHabit(habit['title']),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              PrimaryButton(
                text: 'Next',
                onPressed: _completeRegistration,
              ),
            ],
          ),
        ),
      ),
    );
  }
}