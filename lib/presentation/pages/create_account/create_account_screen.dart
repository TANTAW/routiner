import 'package:flutter/material.dart';
import 'package:routiner/core/theme/app_colors.dart';
import 'package:routiner/core/widgets/labeled_text_field.dart';

import 'package:routiner/core/widgets/primary_button.dart';
import 'package:routiner/presentation/pages/create_account/gender_selection_screen.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _birthdateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _birthdateController.dispose();
    super.dispose();
  }

  void _clearName() {
    setState(() {
      _nameController.clear();
    });
  }

  void _navigateToGenderSelection() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GenderSelectionScreen(
            name: _nameController.text,
            surname: _surnameController.text,
            birthdate: _birthdateController.text,
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
        backgroundColor: Colors.white,
        elevation: 0.5,
        foregroundColor: AppColors.textPrimary,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextField(
                  label: 'NAME',
                  hintText: 'Enter your name',
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                AppTextField(
                  label: 'SURNAME',
                  hintText: 'Enter your surname',
                  controller: _surnameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your surname';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                AppTextField(
                  label: 'BIRTHDATE',
                  hintText: 'mm/dd/yyyy',
                  controller: _birthdateController,
                  keyboardType: TextInputType.datetime,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your birthdate';
                    }
                    // Add more validation for date format if needed
                    return null;
                  },
                ),
                const Spacer(),
                PrimaryButton(
                  text: 'Next',
                  onPressed: _navigateToGenderSelection,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}