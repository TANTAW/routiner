import 'package:flutter/material.dart';
import 'package:routiner/core/theme/app_colors.dart';
import 'package:routiner/core/widgets/primary_button.dart';
import 'package:routiner/core/widgets/selectable_card.dart';
import 'package:routiner/presentation/pages/create_account/habit_selection_screen.dart';

class GenderSelectionScreen extends StatefulWidget {
  final String name;
  final String surname;
  final String birthdate;

  const GenderSelectionScreen({
    Key? key,
    required this.name,
    required this.surname,
    required this.birthdate,
  }) : super(key: key);

  @override
  State<GenderSelectionScreen> createState() => _GenderSelectionScreenState();
}

class _GenderSelectionScreenState extends State<GenderSelectionScreen> {
  String? _selectedGender;

  void _navigateToHabitSelection() {
    if (_selectedGender != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HabitSelectionScreen(
            name: widget.name,
            surname: widget.surname,
            birthdate: widget.birthdate,
            gender: _selectedGender!,
          ),
        ),
      );
    }
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
                'Choose your gender',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  Expanded(
                    child: SelectableCard(title: 'Male', icon: Image.asset(
                      'assets/images/male_avatar.png',
                      height: 80,
                    ), isSelected: _selectedGender == 'Male', onTap: () {
                      setState(() {
                        _selectedGender = 'Male';
                      });
                    }),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: SelectableCard(title: 'Female', icon: Image.asset(
                      'assets/images/female_avatar.png',
                      height: 80,
                    ), isSelected: _selectedGender == 'Female', onTap: () {
                      setState(() {
                        _selectedGender = 'Female';
                      });
                    }),
                  ),
                ],
              ),
              const Spacer(),
              PrimaryButton(
                text: 'Next',
                onPressed: _navigateToHabitSelection,
              ),
            ],
          ),
        ),
      ),
    );
  }
}