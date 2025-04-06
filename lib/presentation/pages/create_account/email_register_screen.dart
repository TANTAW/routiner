import 'package:flutter/material.dart';
import 'package:routiner/core/theme/app_colors.dart';
import 'package:routiner/core/widgets/labeled_text_field.dart';
import 'package:routiner/core/widgets/primary_button.dart';
import 'package:routiner/core/widgets/text_action_button.dart';
import 'package:routiner/presentation/pages/create_account/create_account_screen.dart';

class EmailRegisterScreen extends StatefulWidget {
  const EmailRegisterScreen({Key? key}) : super(key: key);

  @override
  State<EmailRegisterScreen> createState() => _EmailRegisterScreenState();
}

class _EmailRegisterScreenState extends State<EmailRegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _clearEmail() {
    setState(() {
      _emailController.clear();
    });
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Simulate create_account process
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _isLoading = false;
        });
        // Navigate to next screen
        if (mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateAccountScreen(),
            ),
          );
        }
      });
    }
  }

  void _navigateToSignup() {
    // Navigate to signup screen
  }

  void _navigateToForgotPassword() {
    // Navigate to forgot password screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Continue with email'),
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
                EmailField(controller: _emailController, onClear: _clearEmail),
                const SizedBox(height: 24),
                PasswordField(
                  controller: _passwordController,
                ),
                const SizedBox(height: 16),
                TextActionButton(
                  text: 'I forgot my password',
                  onPressed: _navigateToForgotPassword,
                ),
                const Spacer(),
                Center(
                  child: TextActionButton(
                    text: "Don't have account? Let's create!",
                    onPressed: _navigateToSignup,
                  ),
                ),
                const SizedBox(height: 16),
                PrimaryButton(
                  text: 'Next',
                  onPressed: _handleLogin,
                  isLoading: _isLoading,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
