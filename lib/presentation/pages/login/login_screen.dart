import 'package:flutter/cupertino.dart';
import 'package:routiner/core/widgets/labeled_text_field.dart';
import 'package:routiner/core/widgets/primary_button.dart';
import 'package:routiner/core/widgets/text_action_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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

      // Simulate login process
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _isLoading = false;
        });
        // Navigate to next screen
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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LabeledTextField(
                label: 'E-MAIL',
                controller: _emailController,
                showClearButton: _emailController.text.isNotEmpty,
                onClear: _clearEmail,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              LabeledTextField(
                label: 'PASSWORD',
                hintText: 'Enter your password',
                obscureText: true,
                controller: _passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
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
    );
  }
}